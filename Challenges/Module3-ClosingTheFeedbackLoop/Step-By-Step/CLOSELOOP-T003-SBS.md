# Step by Step CLOSELOOP-T003

If you rather watch a video with step by step instructions, you can do that here
[![Step by Step Video](https://img.youtube.com/vi/uvtSyui9l_I/0.jpg)](https://www.youtube.com/watch?v=uvtSyui9l_I)

In this challenge you are going to setup a CI/CD pipeline in Azure DevOps that gets the sources from GitHub. The pipeline will have 1 deployment stage that deploys to the production environment. This has an manual approval gate.

## Disable GitHub Actions

When we commit a change to our repository, we want to make sure, the Azure DevOps pipeline will build and deploy the changes. The already existing GitHub Actions should not be triggered anymore. 

1. In your GitHub Codespace, open the `docker-publish.yml` workflow file. Replace `branches: ...` with the following statement

```YAML
on:
  push:
    branches-ignore:
      - '**'
```
## Configure an Azure DevOps Pipeline

1. Navigate to your Azure DevOps Project that was created in the [prerequisites setup](/Challenges/Prerequisites/Readme.md), and create a new Pipeline

![](/Assets/NewPipeline.png)

2. In the Connect Tab, choose GitHub
![](/Assets/GHCOnnection.png)

3. Select your GitHub repository. Azure DevOps will redirect you to authorize yourself to GitHub. Login and select the repository that you want to have enable to access from Azure DevOps

![](/Assets/authorizeGH.png)

4. In the Configure Tab, choose the Starter Pipeline and Save the file to the GitHub repository \

![](/Assets/starterpipeline.png)

## Setup Service Connection in your Azure DevOps Project

Before we can start building the build and release pipelines, we need to setup a connection between Azure DevOps and the GitHub Container Registry so that we can push our Docker images when they have been built.

1. Navigate to your Azure DevOps Project that was created in the [prerequisites setup](/Challenges/Prerequisites/Readme.md). In the Project Settings, open the Service Connections Tab.

![](/Assets/ServiceConnection.png)

2. Create a new [Docker Registry] Service Connection, and set the values
* Docker Registry = https://ghcr.io
* Docker ID = notrelevant
* Docker Password = `<Your GitHub Personal Access Token>`
* Service connection name = GitHub Container Registry

![](/Assets/NewServiceConnectionDetails.png)

## Create the Build Stage

First we need to create the build stage in the Azure DevOps pipeline. Instead of using command line options like in GitHub Actions, Azure DevOps has a marketplace task that can run docker compose commands in a secure manner.

1. In your Azure DevOps Project, Edit the pipeline you created in the previous step.
2. Remove all steps. Keep the `steps:` keyword in the file
3. First we need to make sure we checkout all sources from GitHub. Add the following snippet after `steps:` to do this.

```YAML
- checkout: self
```

4. In the side bar, find the Docker compose task, and configure it. After that add it to your pipeline. Set the following fields

![](/Assets/Docker%20Compose%20Task.png)

* Container Registry Type = Container Registry
* Docker Registry Service Connection = GitHub Container Registry (created in previous step)
* Docker Compose File = **/docker-compose.yml
* Additional Docker Compose Files= build.docker-compose.yml
* Action = Build Service Images
* Additional Image Tags = $(Build.BuildNumber)

5. Repeat step 3 and add another Docker compose task. Set the Action to Push Service Images

```YAML
      - task: DockerCompose@0
        inputs:
          containerregistrytype: 'Container Registry'
          dockerRegistryEndpoint: 'GitHub Container Registry'
          dockerComposeFile: '**/docker-compose.yml'
          additionalDockerComposeFiles: 'build.docker-compose.yml'
          action: 'Build services'
          additionalImageTags: '$(Build.BuildNumber)'
      - task: DockerCompose@0
        inputs:
          containerregistrytype: 'Container Registry'
          dockerRegistryEndpoint: 'GitHub Container Registry'
          dockerComposeFile: '**/docker-compose.yml'
          additionalDockerComposeFiles: 'build.docker-compose.yml'
          action: 'Push services'
          additionalImageTags: '$(Build.BuildNumber)'
```

6. Run the build. This builds and pushes a latest version to the GitHub Container registry.

## Adding Stages to the pipeline

Now we have all steps (checkout, build and push) complete we can focus on deployment. But before we do that, we need to create 2 stages in our pipeline to distinguish between what is done during build and during deployment.

1. Open the pipeline in edit mode, and add the following snippet to create 2 stages. A build stage, with the existing steps, and an empty deploy stage

```YAML
stages:
  - stage: build
    jobs:
    - job: 'BuildAndpublish'
      displayName: 'Build and Publish'
      steps:
            ...
  - stage: DeployProd
    dependsOn: build
```

## Adding deployment to Azure 

Now that we have split the build and deployment we need to add the deployment steps to the pipeline. Before we can deploy anything to Azure, we need to create an Azure Service Connection.

1. Navigate to your Azure DevOps Project that was created in the [prerequisites setup](/Challenges/Prerequisites/Readme.md). In the Project Settings, open the Service Connections Tab.
2. Create a new [Azure Resource Manager] Service Connection and choose Service Principal (automatic)
3. Choose your target subscription and resource group and set the Service Connection name to [Fabrikam-Azure]
4. Save the Service Connection
5. In your pipeline, add the following snippet in the DeployProd stage. This deploys all infrastructure

```YAML
  - stage: DeployProd
    dependsOn: build
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
                  azureSubscription: 'Fabrikam-Azure'
                  scriptType: 'pscore'
                  scriptLocation: 'scriptPath'
                  scriptPath: './infrastructure/deploy-infrastructure.ps1'
                  arguments: '<your abbreviation>'
                env:
                  CR_PAT: $(CR_PAT)
```

6. The deploy-infrastructure.ps1 uses an environment variable $(CR_PAT). You need to set this as secret variable in the pipeline. Press the variables button on top of the pipeline editor 
![](/Assets/varButtron.png)

Add a secret variable CR_PAT and set it to secret.

![](/Assets/secretVar.png)

## Adding Manual Approval

Now that we have a pipeline that builds and deploys, we can add a manual approval. In the `DeployProd` stage, there is an environment called `production`. This environment represents a physical target. 

1. In the menu under pipelines, select `[Environments]` and select production

![](/Assets/2020-10-16-15-30-29.png)

2. Select the 3 dots, to see the options of this environment
![](/Assets/2020-10-16-15-31-56.png)

3. Choose Approvals and Checks. Add a user, and press Create

4. Run the pipeline and notice how the pipeline waits before moving to the DeployProd stage


> When you do not want to type all commands try the solution Pull Request by running

```
Workshop-Step Solution "CLOSELOOP-T003"
```


 


