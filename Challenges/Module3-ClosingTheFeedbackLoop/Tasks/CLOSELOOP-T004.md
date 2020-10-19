# Deploy latest validated version with automated approvals

Everything is looking great. The Azure DevOps pipeline is running, and is building and pushing the latest version to the Azure WebApp. However, there is some confusion about the tag "latest". What is the latest version? Since the container images are also tagged with a build number, the team wants to make it explicit that the deployment uses the version instead of the latest version.

Furthermore, it happens that developers update the docker-compose file locally, to use their own container images, and sometimes this slips into the committed source code. The team wants to fix this to make the pipeline even more robust.

## Challenge

In this challenge you are going to replace the `:latest` tag in the docker-compose file with the build number from the pipeline. You will also add an automated check to the pipeline to validate if images are only coming from your own GitHub repository using an automated policy. 

## Validation

* Pipeline contains script to deploy versioned containers
* Production environment contains an [Evaluate Artifact] automated approval that checks if the container registry is on a whitelist

> Tips:
> Use the powershell task in the Azure Pipeline to replace the :latest tag in the docker-compose file with the version of the build
>
> ```YAML
> - powershell: (gc .\docker-compose.yml) -replace ':latest',':$(Build.BuildNumber)' | set-content .\docker-compose.yml
> ```

## Links & Information

* [Evaluate Artifact Policy](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/artifact-policy?view=azure-devops#check-allowed-registries)

## Solution

If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command, a Pull Request with the files and instructions will be created for you. 

```powershell
Workshop-Step Solution "CLOSELOOP-T004"
```

To read or view a step by step explanation of this challenge, please visit [this page](/Challenges/Module3-ClosingTheFeedbackLoop/Step-By-Step/CLOSELOOP-T004-SBS.md)

### Next Step

Congratulations, you have completed the workshop!

Now that the Continuous Delivery pipeline has been set up, the product owner notices that changes, that she wants to announce all at once, are ending up straight into production. Even worse, some customers complain about these new features and unknown behavior. One of the developers mentions to start using feature flags to hide certain functionality. That is a great idea, but for now this is too much work and too complicated to set up. The team decides wants to set up a manual approval workflow to allow the product owner to approve changes before they end up in production. 

After some research they find that GitHub Actions is very good at automation and is more then sufficient for the developer workflow. But a more enterprise requirement, like adding approvals, is very hard with GitHub. You and your team advise to look at Azure DevOps again. Since all work is already registered there, it makes sense to build the build and release pipeline within Azure DevOps, and implement the manual approval. Furthermore, the integration between GitHub and Azure DevOps is great with the Azure Pipelines extension

## Challenge

In this challenge you are going to setup a CI/CD pipeline in Azure DevOps that gets the sources from GitHub. The pipeline will have 1 deployment stage that deploys to the production environment. This has an manual approval gate. 

## Validation

* GitHub Actions are disabled
* Azure DevOps YAML Pipeline created with a build stage, that uses docker compose to build and publish images to the GitHub Container Registry
* Azure DevOps pipeline build sources from the GitHub repository
* DeployProd stage added that deploys the infrastructure with the `deploy-infrastructure.ps1` file
* WebApp deployed from the pipeline using the docker-compose file
* Secret added for GitHub Container Registry
* Environment production added to the pipeline with a manual approval


## Links & Information

* [Disabling GitHub Action Triggers](https://github.community/t/how-can-i-disable-a-github-action/17049/3).
* [Install the Azure Pipelines App into your GitHub account](https://github.com/apps/azure-pipelines/installations/new)
* [Create a Docker Registry service connection](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml&WT.mc_id=DOP-MVP-5001511#sep-docreg).
* [Create Azure DevOps Pipelines stages](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/stages?view=azure-devops&tabs=yaml&WT.mc_id=DOP-MVP-5001511)
* [Checkout sources in a pipeline](https://docs.microsoft.com/en-us/azure/devops/pipelines/yaml-schema?view=azure-devops&tabs=schema%2cparameter-schema&WT.mc_id=DOP-MVP-5001511#checkout), 
* [Use the Docker compose task for build](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/build/docker-compose?view=azure-devops&WT.mc_id=DOP-MVP-5001511#build-service-images),
* [Use the Docker compose task for publish](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/build/docker-compose?view=azure-devops&WT.mc_id=DOP-MVP-5001511#push-service-images)
* [use an Azure CLI step to update the web app service](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/deploy/azure-cli?view=azure-devops&WT.mc_id=DOP-MVP-5001511)
* [Variables in Azure DevOps](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2cbatch&WT.mc_id=DOP-MVP-5001511#secret-variables).
* [Dependencies between pipeline stages](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/stages?view=azure-devops&tabs=yaml&WT.mc_id=DOP-MVP-5001511#specify-dependencies) using the `dependsOn`.
* [Manual Approval to deploy](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/approvals?view=azure-devops&tabs=check-pass&WT.mc_id=DOP-MVP-5001511#approvals).
