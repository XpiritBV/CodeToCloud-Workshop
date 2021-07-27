# Running containers in an Azure Web App

The database is running and the team found out that you can run multi-container application in an Azure Web App as well. The DevOps team has successfully automated the deployment of these Azure Resources. Now it is time to start running the application in the cloud. The team already uses docker compose to build the containers, to test the application locally and to push them to the GitHub Container Registry. Now it is time to run the application in the cloud without redoing all the work!

## Challenge

In this challenge you will run the WEB and API application in an Azure Web App, using the multi-container Web App, while it connects with the CosmosDB. The INIT container, that was pushed to the registry as well, can be run from your codespace while connected to the CosmosDB to populate the CosmosDB. 


1. To deploy a multi-container application to an Azure Web App use the `az webapp config container --multicontainer-config-file --multicontainer-config-type COMPOSE` command. 

2. To be able to pull a container from the GitHub Container Registry in to the Azure Web app, you need to configure the Docker registry in the `az webapp config` command using the `docker-registry-server-password`, `docker-registry-server-url` and `docker-registry-server-user` switches.

3. To populate the CosmosDB run the fabrikam-init container with `MONGODB_CONNECTION` environment variable set to the CosmosDB

4. To be able to access the CosmosDB, set an Application Setting `MONGODB_CONNECTION` variable in the Web App Configuration with the connection string to the CosmosDB

## Validation

* Docker compose file deployed to Azure Web App
* Web application showing the conference site
* API showing data from the CosmosDB
* Web site is accessible via Public IP address
* Deployed the fabrikam-init container to the cluster that connects to the CosmosDB

> Tips
>
> * Make sure you add the environment variable `CONTENT_API_URL` to the web service in the docker compose file
>
>    ```YAML
>    environment:
>      CONTENT_API_URL: http://api:3001
>    ```
>
> * Make sure you add the environment variable `MONGODB_CONNECTION` to the API service  in the docker compose file
>
>    ```
>    environment:
>      MONGODB_CONNECTION: mongodb://mongo:27017/contentdb  
>    ```

## Links & Information

* [https://docs.microsoft.com/en-us/azure/app-service/quickstart-multi-container](https://docs.microsoft.com/en-us/azure/app-service/quickstart-multi-container/)

## Solution

If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command from the PowerShell Terminal, a Pull Request with the files and instructions will be created for you. 

```powershell
Workshop-Step Solution "MOVECLOUD-T002"
```

To read or view a step by step explanation of this challenge, please visit [this page](/Challenges/Module2-MovingToTheCloud/Step-By-Step/MOVECLOUD-T002-SBS.md)

### Next Step

When you are done, move to the [next challenge](/Challenges/Module3-ClosingTheFeedbackLoop/ClosingTheFeedbackloop.md)
                                                 
