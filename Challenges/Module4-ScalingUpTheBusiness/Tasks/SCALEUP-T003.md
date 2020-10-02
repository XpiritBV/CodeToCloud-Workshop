# Creating Microservice deployments for your container
The application is running in the cluster. The source code repository contains a number of Kubernetes YAML files for deployments and services and the team is using them to deploy their containers. In a design session for a new customers, one of the developers notice that they need to copy all of the Kubernetes files for every instance of their application. All the files look the same, only the configuration of application differs. Besides that, people need to have knowledge about the Microservice to know what needs to be deployed.

Helm charts are used for deploying third-party services, but the team suggests to take a look at Helm charts for our own application too. Helm is a package manager for Kubernetes, and allows you to package a deployment of a Microservice is a single package. In Helm this is called a Helm chart. The package can be reused with different values and contains all components that need to be deployed. Furthermore, it allows you to create a release of a Microservice (with a version number) and install / uninstall / rollback this release with 1 command

## Challenge
In this challenge you are going to create a Helm chart for both the WEB and API Microservice. For that you need to use Helm. In a newly created folder charts, run the `helm create` command to start you work on a chart. Start by updating the `values.yaml` file and after that update the `deployment.yaml` and `service.yaml` to configure some specific values for this microservices. Finally take a look at the `Chart.yaml` to set your version. When done configuring the application, remove the already running WEB and API application, and deploy your service by running the `helm install <name> <folder>` command.

>Tip: Take a look at the previously created deploy and service.yml files to see the setting that need to be added to the helm chart

## Validation
* Web application deployed using Helm and running in the cluster on internal port 3000 and external port 80
* API application deployed using Helm and running in the cluster on internal port 3001
* API application uses the CosmosDB 
* Helm charts committed to the Git Repository and merged to master in a `charts` folder

## Links
* [What is a Helm Chart](https://www.coveros.com/what-is-a-helm-chart-a-beginners-guide/)
* [Helm Create](https://helm.sh/docs/helm/helm_create/)
* [Helm Documentation](https://helm.sh/)