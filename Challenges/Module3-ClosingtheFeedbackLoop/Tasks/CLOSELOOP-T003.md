# Increase control with Azure DevOps CI/CD

Now that the Continuous Delivery pipeline has been set up, the product owner notices that changes, that she wants to announce all at once, are ending up straight into production. Even worse, some customers complain about these new features and unknown behavior. One of the developers mentions to start using feature flags to hide certain functionality. That is a great idea, but for now this is too much work and too complicated to set up. The team decides wants to set up a manual approval workflow to allow the product owner to approve changes before they end up in production. 

After some research they find that GitHub Actions is very good at automation and is more then sufficient for the developer workflow. But a more enterprise requirement, like adding approvals, is very hard with GitHub. You and your team advise to look at Azure DevOps again. Since all work is already registered there, it makes sense to build the build and release pipeline within Azure DevOps, and implement the manual approval. Furthermore, the integration between GitHub and Azure DevOps is great with the Azure Pipelines extension

## Challenge

In this challenge you are going to setup a CI/CD pipeline in Azure DevOps that gets the sources from GitHub. The pipeline will have 1 deployment stage that deploys to the production environment. This has an manual approval gate.

First, lets update the GitHub actions so they won't trigger on our changes.

 * [Either add `if: false` to your existing actions, or disable all triggers](https://github.community/t/how-can-i-disable-a-github-action/17049/3).

Now configure a newf Azure Pipeline

 * In your Azure DevOps environment create a new Pipeline
 * Connect it to GitHub. Either authorize your own account or [install the Azure Pipelines App into your GitHub account](https://github.com/apps/azure-pipelines/installations/new) and authorize it to access this repo.
 * [Create a Docker Registry service connection](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml&WT.mc_id=DOP-MVP-5001511#sep-docreg).
 * [Create 2 stages](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/stages?view=azure-devops&tabs=yaml&WT.mc_id=DOP-MVP-5001511). One to build & publish the docker images. One to update the azure app service.
 * In the build stage:
   * [checkout the sources](https://docs.microsoft.com/en-us/azure/devops/pipelines/yaml-schema?view=azure-devops&tabs=schema%2cparameter-schema&WT.mc_id=DOP-MVP-5001511#checkout), 
   * [use the dcoker compose task to build the images](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/build/docker-compose?view=azure-devops&WT.mc_id=DOP-MVP-5001511#build-service-images),
   * [use the dcoker compose task to publish the images](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/build/docker-compose?view=azure-devops&WT.mc_id=DOP-MVP-5001511#push-service-images)
 * In the deploy stage:
   * [checkout the sources](https://docs.microsoft.com/en-us/azure/devops/pipelines/yaml-schema?view=azure-devops&tabs=schema%2cparameter-schema&WT.mc_id=DOP-MVP-5001511#checkout), 
   * set the correct version in the `prod.docker-compose.yml`. You can use a simple powershell script step to replace `:latest` with the `$(Build.BuildNumber)` variable.
   * [use an Azure CLI step to update the web app service](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/deploy/azure-cli?view=azure-devops&WT.mc_id=DOP-MVP-5001511). Be sure to specify `scriptType: pscore` and `scriptLocation: inlineScript`.
     * If needed, make sure you [authorize the correct Azure Subscription](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/connect-to-azure?view=azure-devops&WT.mc_id=DOP-MVP-5001511).
 * [Use the `Variables` button in the Azure DevOps Pipeline editor to store the GitHub Access Token for your GitHub Contaner Registry as a secret](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2cbatch&WT.mc_id=DOP-MVP-5001511#secret-variables).
 * [Set the correct dependencies between the stages](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/stages?view=azure-devops&tabs=yaml&WT.mc_id=DOP-MVP-5001511#specify-dependencies) using the `dependsOn`.
 * Save your pipeline and run it until the environment is succesfully updated.

To configure approvals we need to link the stages to an "Environment". We'll need to create an Environment in Azure Pipelines and update the second stage to target that environment:

 * [Create an environment called `production`](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/environments?view=azure-devops&WT.mc_id=DOP-MVP-5001511). Use Resource `None`.
 * [Open the environment and configure the Approval check to require manual approval to deploy](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/approvals?view=azure-devops&tabs=check-pass&WT.mc_id=DOP-MVP-5001511#approvals).
 * [Update the deploy stage in the `azure-pipelines.yml` to target the environment.](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/environments?view=azure-devops&WT.mc_id=DOP-MVP-5001511#target-an-environment-from-a-deployment-job).
 * Save your pipeline and run it until requires approvalr and updates the environment is succesfully.

## Validation
https://github.com/marketplace/azure-pipelines


## Solution

If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command, a Pull Request with the files and instructions will be created for you. 

```powershell
Workshop-Step Solution "CLOSELOOP-T003"
```