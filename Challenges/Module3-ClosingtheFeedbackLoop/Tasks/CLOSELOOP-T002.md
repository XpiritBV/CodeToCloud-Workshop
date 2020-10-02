# Setup Continuous Deployment
Currently all deployments are done manually using the Kubernetes command line tool. Although this works very nicely, there are only a few people in the team that are comfortable with doing a new release of the application. Furthermore, there are some steps that need to followed before doing a release that are sometimes forgotten. You and your team advice that is time to set up a Continuous Deployment(CD) pipeline that takes care of the deployment of a new version after the new containers have been built and pushed to the container registry. This CD pipeline should ensure that the latest version of the containers are pushed to the cluster.

## Challenge 
In this challenge your are going to create a continuous deployment pipeline that triggers after the Continuous Integration build has been completed. The latest version (use the version number) of the containers should be pushed to the cluster using the helm chart

# Challenge
* Create release pipeline in Azure DevOps that deploys the container from the GitHub repo

https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/github-actions?view=azure-devops

https://medium.com/@mattiaperi/create-a-public-helm-chart-repository-with-github-pages-49b180dbb417

helm repo add rvo https://renevanosnabrugge.github.io/CodeToCloud-Source/ --> GH pages url
