# Step by Step MOVECLOUD-T002

If you'd rather watch a video with step by step instructions, you can do that here
[![Step by Step Video](https://img.youtube.com/vi/mKH21IgKUSc/0.jpg)](https://www.youtube.com/watch?v=mKH21IgKUSc)

In this task you will run the WEB and API application as a multi-container application within an Azure Web App while it connects with the CosmosDB. The INIT container, that was pushed to the registry as well, can be used to populate the CosmosDB. 

1. To be able to access the CosmosDB, you need to add the connectionstring as environment variable to the Azure Web App. Retrieve the connectionstring to the CosmosDB in the [portal](http://portal.azure.com/) or use the following command and use the Primary MongoDB ConnectionString.

    ```
    az cosmosdb keys list -n $cosmosDBName -g $resourceGroupName --type connection-strings
    ```

2. Fill the cosmos DB by running the init container from the Github Container Registry (ghcr)

```
docker run -ti  -e MONGODB_CONNECTION="mongodb://xxx.documents.azure.com:10255/contentdb?ssl=true&replicaSet=globaldb" ghcr.io/<your-github-account>/fabrikam-init

```
3. In the [Azure Portal](http://portal.azure.com/), navigate to the Web Application and open the Configuration Blade. In the configuration blade add a new Application Setting and call this MONGODB_CONNECTION. Add the MongoDB Connection String as a value.

![](/Assets/AppSetting.png)

If you'd rather want to run this as code, you can use the command

```
az webapp config appsettings set -n $webappName -g $resourcegroupName --settings MONGODB_CONNECTION="mongodb://xxx.documents.azure.com:10255/contentdb?ssl=true&replicaSet=globaldb"
```

4. In the Azure Portal, navigate to the Web Application and open the Container Blade. In the Container blade, select the Docker Compose Tab. Select Private Registry under Image Source. 

Fill in the following data:
* Server URL: https://ghcr.io
* Login: notapplicable
* Password: Your GitHub Personal Access Token

As file, choose the `docker-compose.yml` file that you created earlier, and press Save.

![](/Assets/containerblade.png)

5. The Azure Web App will now create two containers in the web app. Navigate to the Web app https://$webappname.azurewebsites.net to validate if the application is working

6. To update the website from a command line run the following command

```PowerShell
az webapp config container set `
--docker-registry-server-password <yourgithub personal access token> `
--docker-registry-server-url https://ghcr.io `
--docker-registry-server-user notapplicable `
--multicontainer-config-file docker-compose.yml `
--multicontainer-config-type COMPOSE `
--name $webappName `
--resource-group $resourcegroupName 
```

> When you do not want to type all commands try the solution Pull Request by running the following command from the PowerShell Terminal window:

```
Workshop-Step Solution "MOVECLOUD-T002"
```
