# Running containers in a cluster

The cluster and database are running and the DevOps team has successfully automated the deployment of these Azure Resources. Now it is time to start running the application in the cloud. The container have already been pushed to the GitHub Container Registry so they can get started with the cluster right away. 

## Before you start this challenge

This challenge needs some prerequisites. Run the following command in your Terminal windows of your GitHub Codespace to set this up.

```powershell
.workshop/workshop-step.ps1  Start "SCALEUP-T002"
```

## Challenge

In this challenge you will run the WEB and API application on the cluster, while it connects with the CosmosDB. The INIT container, that was pushed to the registry as well, can be used to populate the CosmosDB. You will use the kubectl commands and YAML files to deploy them. 

In your repository create a new folder called AKS, that will contain all files that you create to deploy your resources to the cluster

1. To deploy a container to AKS you can use the `kubectl apply -f file.yml` command. The file to deploy needs to be a [Deployment file](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment). 

2. To be able to pull a container from the GitHub Container Registry in to the AKS cluster, you need to configure a pull secret in AKS. You can do this by running the `kubectl create secret` command. [This blog post](https://roadtoalm.com/2020/09/22/using-the-github-container-registry-with-azure-kubernetes-service-aks/) describes how to configure you deployments to pull from GHCR.

3. To expose a container to the outside world or reachable on the cluster, you need to [add a service in AKS](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service). 

4. Your API container needs to connect to the CosmosDB that you deployed. You can add the connectionstring to the CosmosDB in a Kubernetes Secret using `kubectl create secret generic cosmosdb --from-literal=db=mongoDBconnectionstring` 

5. Make sure you add the name contentdb in the connectionstring --> `mongodb://cosmosdbaccount:KEY@cosmosdbaccount.documents.azure.com:10255/contentdb?ssl=true&replicaSet=globaldb`

## Validation

* Pull Secret created in AKS
* Web site showing data from the API
* API showing data from the CosmosDB
* Web site is accessible via Public IP address
* Deployed the fabrikam-init container to the cluster that connects to the CosmosDB

> Tips
>
> * Make sure you add the environment variable `CONTENT_API_URL` to the WEB container deployment
>
>    ```yaml
>    containers:
>    - image: ghcr.io/yourrepo/fabrikam-web:latest 
>      env:
>      - name: CONTENT_API_URL
>        value: http://api:3001
>    ```
>
> * Make sure you add the environment variable `MONGODB_CONNECTION` to the API container deployment
>
>    ```yaml
>    containers:
>    - image: ghcr.io/yourrepo/fabrikam-api:latest 
>      env:
>      - name: MONGODB_CONNECTION
>        valueFrom:
>        secretKeyRef:
>          name: cosmosdb
>          key: db   
>    ```

## Links & Information

* [Kubernetes Deployment file](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment)
* [Creating GitHub Container Registry Pull Secret](https://roadtoalm.com/2020/09/22/using-the-github-container-registry-with-azure-kubernetes-service-aks/)
* [Create a Kubernetes Service](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

## Solution

If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command, a Pull Request with the files and instructions will be created for you. 

```powershell
.workshop/workshop-step.ps1 Solution "SCALEUP-T002"
```

### Next Step

When you are done, move to the [next challenge](/Challenges/Module3-ClosingtheFeedbackLoop/ClosingTheFeedbackLoop.md)