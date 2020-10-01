# Running containers in a cluster
Our cluster and database are running and the DevOps team has successfully automated the deployment of these Azure Resources. Now it is time to start running the application in the cloud. The container have already been pushed to the GitHub Container Registry so they can get started with the cluster right away. 

## Challenge
In this challenge you will run the WEB and API application on the cluster, while it connects with the CosmosDB. You will use the kubectl commands and YAML files to deploy them. 

To deploy a container to AKS you can use the `kubectl apply -f file.yml` command. The file to deploy needs to be a [Deployment file](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#creating-a-deployment). 

To be able to pull a container from the GitHub Container Registry in to the AKS cluster, you need to configure a pull secret in AKS. You can do this by running the `kubectl create secret` command. [This blog post](https://roadtoalm.com/2020/09/22/using-the-github-container-registry-with-azure-kubernetes-service-aks/) describes how to configure you deployments to pull from GHCR.

To expose a container to the outside world or reachable on the cluster, you need to [add a service in AKS](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service). 

Your API container needs to connect to the CosmosDB that you deployed. You can add the connectionstring to the CosmosDB in a Kubernetes Secret using `kubectl create secret generic cosmosdb --from-literal=db=mongoDBconnectionstring` Make sure you add the name contentdb in the connectionstring --> `mongodb://cosmosdbaccount:KEY@cosmosdbaccount.documents.azure.com:10255/contentdb?ssl=true&replicaSet=globaldb`

## Validation
* Pull Secret created in AKS
* Web site showing data from the API
* API showing data from the CosmosDB
* Web site is accessible via Public IP address
* Deployed the fabrikam-init container to the cluster that connects to the CosmosDB

> Tips
> * Make sure you add the environment variable `CONTENT_API_URL` to the WEB container deployment
>```
>containers:
>- image: ghcr.io/yourrepo/fabrikam-web:latest 
>    env:
>    - name: CONTENT_API_URL
>        value: http://api:3001
>```
> * Make sure you add the environment variable `MONGODB_CONNECTION` to the API container deployment
>```
>containers:
>- image: ghcr.io/yourrepo/fabrikam-api:latest 
>    env:
>    - name: MONGODB_CONNECTION
>        valueFrom:
>        secretKeyRef:
>            name: cosmosdb
>            key: db     
>```
