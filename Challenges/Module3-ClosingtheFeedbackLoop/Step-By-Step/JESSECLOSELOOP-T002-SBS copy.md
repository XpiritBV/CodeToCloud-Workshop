# Step by Step CLOSELOOP-T002

In this task your are going to create a continuous deployment pipeline that triggers after the Continuous Integration build has been completed. The latest version (use the version number) of the containers should be pushed to the cluster using the helm chart.

Adcanced validation and approvals (a more enterprisey feature) is currently found in Azure Pipelines and hasn'g ade its way into GitHub yet. Luckily most of the build logic is caputured on our Docker-Compose files, so migrating the pipeline isn't very complex.

# Connect GitHub to Azure DevOps

 * Create service connection of type Docker Container Registy
 * Create new pipeline in your CodeToCloud-Workshop project
 * Where's your code: pick Github
 * Authorize if needed. 
   * Note: everyone with read permissions on the GitHub endpoint will be able to accerr all your repos. 
   * Alternatively: install the Azure Pipelines App to handle auth: https://github.com/apps/azure-pipelines/installations/new
 * Select CodeToSCloud-Source repo
 * Choose the starter pipeline template

# Configure the pipeline

> You can edit your pipeline in the web UI of Azure DevOps using the steps helper, but you can also edit the `azure-pipelines.yml` in vscode and relyon its intellisense feature to guide you.

 * First lets do ecerything in a single job, like we have with actions.
 * Add Docker Compose task for build step
 * Add Docker Compose task for publish step
 * Add PS task to run infrastraucture.ps1
 * Add Azure CLI task to run az web app create... Authorize your Azure DevOps Account to access your Azure Subscription to add a service connection.
 * Use `name:` to set the buildnumber which will be added as a tag the image automatically
 * Make sure trigger is set to `trigger: main` and `pr: main`
 * Normal varialbles are created in the YAML files' variables section. Secret variables must be created on the `Variables` tab hidden under the `[Variables]` menu in the upper right corner of the editor. Add a `GHCR_SECRET` variable and mark its `Keep this value secet` option.


# Add approvals

 * In Azure Pipelines choose "Environments"
 * Create a new environment called "production"
 * Configure approvals for production using the `[...]` menu. Alternatively, show now to do with `az pipelines`
 * edit existing pipeline
 * split the pipeline into 2 stages. 
    1. stage: build
    2. stage: production
       1. job: infra
       2. job: deploy
 * Add `environment: production` to jobs.
 * Add dependencies to stages and jobs `dependsOn:`
 * Make sure the deploy stage won't  run on PR builds. Add `condition:`.
 * Add `checkout: self` to each job to have it checkout the git repo. **If this won't work we need to publish the ps and docker-compose files as artifacts in the build stage instead.**
 * Add PS to replace `:latest` with specific version.


# Add Advanced gates

 * Go to environments, select prod, add more gates:
   * Branch Validation. Must come from main. (optionally verify branch protection to enforce pull request workflow).
   * Container Registries. Ensure all our images are pulled from `ghcr.io`.

Pull all changes into your local repo before continuing to the next task.

```
trigger:
- main

pr:
- main

pool:
  vmImage: 'ubuntu-latest'

variables:   
  WebApp.Name: 'xxxx'
  WebApp.ResourceGroupName: 'xxxx'
  WebApp.Plan: 'xxxx'

# Shows up as $(Build.BuildNumber)
name: '1.0$(rev:.r)'

stages:
  - stage: build
    jobs:
    - job: 'BuildAndpublish'
      displayName: 'Build and Publish'
      steps:
      - checkout: self
      - task: DockerCompose@0
        inputs:
          containerregistrytype: 'Container Registry'
          dockerRegistryEndpoint: 'My GitHub Container Registry'
          dockerComposeFile: '**/docker-compose.yml'
          additionalDockerComposeFiles: '**/build.docker-compose.yml'
          action: 'Build services'
          additionalImageTags: '$(Build.BuildNumber)'
      - task: DockerCompose@0
        inputs:
          containerregistrytype: 'Container Registry'
          dockerRegistryEndpoint: 'My GitHub Container Registry'
          dockerComposeFile: '**/docker-compose.yml'
          additionalDockerComposeFiles: '**/build.docker-compose.yml'
          action: 'Push services'
          additionalImageTags: '$(Build.BuildNumber)'

  - stage: DeployProd
    dependsOn: build
    condition: ne(variables['Build.Reason'], 'PullRequest')
    jobs:
    - deployment: infrastructure
      environment: production
      strategy:
        runOnce:
          deploy:
            steps:
              - checkout: self
              - task: AzureCLI@2
                inputs:
                  azureSubscription: 'Visual Studio Enterprise(2e7b8ca3-042d-49d7-9702-276dcb8cd5ea)'
                  scriptType: 'pscore'
                  scriptLocation: 'scriptPath'
                  scriptPath: './infrastructure/deploy-infrastucture.ps1'

    - deployment: webapp
      environment: production
      strategy: 
        runOnce:
          deploy:
            steps:
              - checkout: self
              - powershell: (gc .\docker-compose.yml) -replace ':latest',':$(Build.BuildNumber)' | set-content .\docker-compose.yml
              - task: AzureCLI@2
                inputs:
                  azureSubscription: 'Visual Studio Enterprise(2e7b8ca3-042d-49d7-9702-276dcb8cd5ea)'
                  scriptType: 'pscore'
                  scriptLocation: 'inlineScript'
                  inlineScript: |
                    az webapp create `
                      --docker-registry-server-password $(GITHUB_PAT)`
                      --docker-registry-server-url https://ghcr.io `
                      --docker-registry-server-user notapplicable `
                      --multicontainer-config-file docker-compose.yml `
                      --multicontainer-config-type COMPOSE `
                      --name $(WebApp.Name) `
                      --resource-group $(WebApp.ResourceGroupName) `
                      --plan $(WebApp.Plan)
```