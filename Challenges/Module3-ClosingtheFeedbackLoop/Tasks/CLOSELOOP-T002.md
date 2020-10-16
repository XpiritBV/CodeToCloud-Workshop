# Setup Continuous Deployment with GitHub Actions

After setting up monitoring, nothing happened. After some investigation it showed that the new container was not used by the Azure Web App, because all deployments are done manually. There are only a few people in the team that are comfortable with doing a new release of the application. You and your team advice that is time to level up the Continuous Integration pipeline to a Continuous Deployment(CD) pipeline. This should take care of the deployment of the infrastructure and of a new version of the containers, when they have been built and pushed to the container registry. The team also finds that instead of creating 3 different pipelines for all containers, the docker-compose files can also be used to build and push the containers all at once.

## Before you start this challenge

This challenge needs some prerequisites. Run the following command in your Terminal windows of your GitHub Codespace to set this up.

```bash
.workshop/workshop-step.ps1  Start "CLOSELOOP-T002"
```

## Challenge 

In this challenge your are going to create a continuous deployment pipeline that triggers after the Continuous Integration build has been completed. The CD Pipeline performs the following steps
* Build a new version of the containers using docker-compose
* Push the latest version of the containers using docker-compose
* Execute the deploy-infrastructure.ps1 and setup


# Challenge

* Create release pipeline in Azure DevOps that deploys the container from the GitHub repo

https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/github-actions?view=azure-devops

https://medium.com/@mattiaperi/create-a-public-helm-chart-repository-with-github-pages-49b180dbb417

```
helm repo add rvo https://renevanosnabrugge.github.io/CodeToCloud-Source/ --> GH pages url
```

## Solution
If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command, a Pull Request with the files and instructions will be created for you. 

```
.workshop/workshop-step.ps1 Solution "CLOSELOOP-T002"
```