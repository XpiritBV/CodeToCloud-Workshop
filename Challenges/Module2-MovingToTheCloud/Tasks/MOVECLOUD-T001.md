# Setting up a cloud infrastructure

Susan wants to move to the cloud. An Azure subscription has been created and known to the developers. Since Fabrikam is doing DevOps, setting up the infrastructure and deploying this to the cloud also needs to be automated. Furthermore, it is the responsibility of the developers (a.ka. DevOps Team) to operate this infrastructure. Fortunately, Azure has a advanced automation engine to automate the roll-out of the infrastructure and advanced features to operate it. Besides that, the people that operate the current-on-premises infrastructure have a vast knowledge of infrastructure and scripting and are eager to move to the cloud as well.

## Challenge

In this challenge you will set up an Azure Resource Group containing a CosmosDB and an Azure Web App that can run containers. To simplify automation you can use the Azure CLI to set this up. The script that you create, needs to be saved in an [**infrastructure**] folder of the [**CodeToCloud-Source**] repository to ensure repeatability and the possibility to run this from within the pipeline

## Validation

* New folder [**infrastructure**] in Codespace with automation script
* Resource group [**fabmedical-rg-<studentsuffix>**] has been created
* Resource group contains a CosmosDB called [**fabmedical-cdb-<studentsuffix>**]
* Resource group contains an Linux Azure Web App called [**fabmedical-web-<studentsuffix>**] and App Service Plan call [**fabmedical-plan-<studentsuffix>**]
  * The plan is a S1 Linux plan 
  * Deploy the empty nginx container (-i nginx) 
  

> Tips
>
> * Use a three letter abbreviation of your name as <studentsuffix> 
> * Create an CosmosDB with 2 locations using the following syntax in the Azure CLI 
>
>    ```Powershell
>    --locations regionName=westeurope failoverPriority=0  isZoneRedundant=False --locations regionName=northeurope failoverPriority=1 isZoneRedundant=True  enable-multiple-write-locations 
>    ```
> use the `az webapp create -g MyResourceGroup -p MyPlan -n MyUniqueAppName -i nginx` to create an empty web app with a container

## Links & Information

* [Install the Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
* [Manage Resource Group with Azure CLI](https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest)
* [Manage CosmosDB with Azure CLI](https://docs.microsoft.com/en-us/cli/azure/cosmosdb?view=azure-cli-latest)
* [Create an Azure Web App](https://docs.microsoft.com/en-us/cli/azure/webapp?view=azure-cli-latest#az_webapp_create)
* [Create a multi-container (preview) app using a Docker Compose configuration](https://docs.microsoft.com/en-us/azure/app-service/quickstart-multi-container)

## Solution

If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command from the PowerShell Terminal, a Pull Request with the files and instructions will be created for you. 

```powershell
Workshop-Step Solution "MOVECLOUD-T001"
```

To read or view a step by step explanation of this challenge, please visit [this page](/Challenges/Module2-MovingToTheCloud/Step-By-Step/MOVECLOUD-T001-SBS.md)

### Next Step
When you are done, move to the [next challenge](MOVECLOUD-T002.md)
