# Step by Step MOVECLOUD-T001

If you rather watch a video with step by step instructions, you can do that here
[![Step by Step Video](https://img.youtube.com/vi/Q2H9LFzWetQ/0.jpg)](https://www.youtube.com/watch?v=Q2H9LFzWetQ)

In this task you are going to create cloud infrastructure, so that your application can run on a cluster in the cloud. For this task we are going to create:

* An **Azure Resource Group** that will serve as the container that contains the resources
* A CosmosDB with Mongo API that can serve as your database
* An Azure Web App and App Service Plan that can serve your application as containers

We can create all these resources manually, but since we want to do this "the DevOps way", we are going to create all resources as Infrastructure as Code. In this Step by Step we chose to create all resources with the Azure CLI and store it in a file.

Before you run any of the snippets in the terminal, make sure you login to your Azure account with 

```bash 
az login
az account set --subscription <your subscription guid>
```

## Prepare your Codespace

1. From your GitHub repository open your Codespace

   ![](/Assets/OpenCodeSpace.png)

1. In the file explorer, create a new folder called `infrastructure`

1. Create a new file called `deploy-infrastructure.ps1`

   ![](/Assets/newfolderinfra.png)

1. To make automation of all resources a bit easier, add these variables in the `deploy-infrastructure.ps1`file

   ```Powershell
   $studentprefix = "your 3 letter abbreviation here"
   $resourcegroupName = "fabmedical-rg-" + $studentprefix
   $cosmosDBName = "fabmedical-cdb-" + $studentprefix
   $webappName = "fabmedical-web-" + $studentprefix
   $planName = "fabmedical-plan-" + $studentprefix
   $location1 = "westeurope"
   $location2 = "northeurope"
   ```

## Create an Azure Resource Group

Create an Azure Resource Group to hold the resources that you create in this hands-on lab. 

1. In the `deploy-infrastructure.ps1` file add a Azure CLI command to create a resource group 

   ```PowerShell
   az group create -l $location1 -n $resourcegroupName
   ```
1. Save the PowerShell file and run it from the terminal:

      ```powershell
      pushd infrastructure
      ./deploy-infrastructure.ps1
      ```

1. When this completes, the [Azure Portal](http://portal.azure.com/) shows your Resource Group.

   ![Resource group created](/Assets/2020-10-09_16-36-24.png) 

   ![In this screenshot of the Azure Portal, the fabmedical- Resource group is listed.](/Assets/b4-image8.png)

### Create a CosmosDB

Azure CosmosDB is a geo-replicated database service running in Azure. This can also be created from the Azure CLI 

1. In your `deploy-infrastructure.ps1` file add the following command

   ```powershell
   #Then create a CosmosDB
   az cosmosdb create --name $cosmosDBName \
   --resource-group $resourcegroupName \
   --locations regionName=$location1 failoverPriority=0 isZoneRedundant=False \
   --locations regionName=$location2 failoverPriority=1 isZoneRedundant=True \
   --enable-multiple-write-locations \
   --kind MongoDB 
   ```

   > This creates a CosmosDB with 2 failover locations with a MongoDB API.

1. Save the PowerShell file and run it from the terminal:

      ```powershell
      pushd infrastructure
      ./deploy-infrastructure.ps1
      ```
 > The deployment of Cosmos DB may take up to 10 minutes!

### Create an Azure Web App and App Service Plan

In this section, you create and configure an App Service Plan and an Azure Web App that hosts a NGINX container with the Azure CLI command line tool.

1. In your `deploy-infrastructure.ps1` file add the following command to create an App Service Plan. The App service plan is basically the pricing tier. Based on the size and features of the chosen plan you pay a certain price. To run containers in an Azure WebApp the plan needs to be a Linux based plan

   ```powershell
   #Create a Azure App Service Plan
   az appservice plan create --name $planName --resource-group $resourcegroupName --sku S1 --is-linux
   ```

1. In your `deploy-infrastructure.ps1` file add the following command to create an Web App. The Web App can be an application running as files a container, or a multi-container application. To create the Web App initially, create it with a single, NGINX container.

   ```
   #Create a Azure Web App with NGINX container
   az webapp create --resource-group $resourcegroupName --plan $planName --name $webappName -i nginx
   ```

1. Save the PowerShell file and run it from the terminal:

      ```powershell
      pushd infrastructure
      ./deploy-infrastructure.ps1
      ```

## Create the infrastructure from script

You have already run the separate steps from the steps a number of times. The fact you can do this over and over again, is called idempotency. If you have not run all the lines in the `deploy-infrastructure.ps1` file, run it now.

1. In your terminal window of the Codespace, Powershell has been opened (if not: type `pwsh`). Then run the `az login` command to login to your azure subscription

   ```powershell
   az login
   az account set --subscription <your subscription guid>
   ```

1. After logging in, run the `deploy-infrastructure.ps1` file.

   ```powershell
      pushd infrastructure
      ./deploy-infrastructure.ps1
   ```

## Browse to the Azure Portal

1. Open the [Azure Portal](http://portal.azure.com/), and validate if the following cloud services have been created: 
* CosmosDB,
* App Service Plan,
* Azure Web App. 

![Resources created in Azure](/Assets/2020-10-15-10-32-42.png)
