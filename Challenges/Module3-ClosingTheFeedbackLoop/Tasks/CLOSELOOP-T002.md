# Setup Continuous Deployment with GitHub Actions

After setting up monitoring, nothing happened. After some investigation it showed that the new container was not used by the Azure Web App, because all deployments are done manually. There are only a few people in the team that are comfortable with doing a new release of the application. You and your team advice that is time to level up the Continuous Integration pipeline to a Continuous Deployment(CD) pipeline. This should take care of the deployment of the infrastructure and of a new version of the containers, when they have been built and pushed to the container registry. The team also finds that instead of creating 3 different pipelines for all containers, the docker-compose files can also be used to build and push the containers all at once.

## Before you start this challenge

This challenge needs some prerequisites. Run the following command in your PowerShell Terminal window of your GitHub Codespace to set this up.

```bash
Workshop-Step Start "CLOSELOOP-T002"
```

## Challenge 

In this challenge your are going to create a continuous deployment pipeline that triggers after the Continuous Integration build has been completed. The CD Pipeline performs the following steps
* Build a new version of the containers using docker-compose
* Push the latest version of the containers using docker-compose
* Execute the deploy-infrastructure.ps1 and setup

## Validation

* Added a build.docker-compose.yml that can build the containers with docker-compose
* GitHub Action added that uses docker-compose to build and publish the containers to the Container Registry
* GitHub secret `AZURE_CREDENTIALS` added that contains the credentials of a Service Principal to deploy application and infrastructure to Azure
* Application deployed to Azure with `deploy-infrastructure.ps1` script

## Links & Information

* [Login with AzureCLI in GitHub Actions](https://github.com/marketplace/actions/azure-login)
* [Docker Compose command line]()

## Solution

If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command from the PowerShell Terminal, a Pull Request with the files and instructions will be created for you. 

```powershell
Workshop-Step Solution "CLOSELOOP-T002"
```

To read or view a step by step explanation of this challenge, please visit [this page](/Challenges/Module3-ClosingTheFeedbackLoop/Step-By-Step/CLOSELOOP-T002-SBS.md)

### Next Step

When you are done, move to the [next challenge](CLOSELOOP-T003.md)
