# Setting up a cloud infrastructure

Susan wants to move to the cloud. An Azure subscription has been created and known to the developers. Since Fabrikam is doing DevOps, setting up the infrastructure and deploying this to the cloud also needs to be automated. Furthermore, it is the responsibility of the developers (a.ka. DevOps Team) to operate this infrastructure. Fortunately, Azure has a advanced automation engine to automate the roll-out of the infrastructure and advanced features to operate it. Besides that, the people that operate the current-on-premises infrastructure have a vast knowledge of infrastructure and scripting and are eager to move to the cloud as well.

## Challenge
In this challenge you will set up an Azure Resource Group containing a CosmosDB and an Azure Kubernetes Cluster. This needs to accessed with an Azure Service Principal for RBAC. To simplify automation you can use the Azure CLI to set this up. The script that you create, needs to be saved in an [**infrastructure**] folder of the [**CodeToCloud-Source**] repository to ensure repeatability and the possibility to run this from within the pipeline

## Validation
* New folder [**infrastructure**] in Codespace with automation script
* Azure Service Principal for RBAC to use with AKS cluster
* Resource group [**fabmedical-rg-<studentsuffix>**] has been created
* Resource group contains a CosmosDB called [**fabmedical-cdb-<studentsuffix>**]
* Resource group contains a AKS cluster called [**fabmedical-aks-<studentsuffix>**]
* Dashboard is visible when browsing with the `az aks browse` command

> Tips
> * Use a three letter abbreviation of your name as <studentsuffix> 
> * Use the `az ad sp create-for-rbac --name GitHubWorkshop` to create an SPN and save the appId and secret
> * Create an CosmosDB with 2 locations using the following syntax in the Azure CLI 
>```PowerShell
>--locations regionName=westeurope failoverPriority=0  isZoneRedundant=False --locations regionName=northeurope failoverPriority=1 isZoneRedundant=True  enable-multiple-write-locations 
>```
>* Enable 2 add-ons on the cluster after creation 
>```
>az aks enable-addons -a monitoring -n $aksName -g $resourcegroupName
>
>az aks enable-addons -a kube-dashboard -n $aksName -g $resourcegroupName
>```
> * Use the `az aks get-credentials` to update your credentials in kube.config
> * Use these commands to set permissions for the dashboard
> ```
> kubectl delete clusterrolebinding kubernetes-dashboard 
>
> kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard --user=clusterUser
> ```
> *  Use the `az aks browse -n $aksName -g $resourcegroupName` to browse to the cluster dashboard
>
>* When browsing to the Kubernetes Dashboard from your Codespace, paste `/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#/login` after the URL that CodeSpaces generates for you

## Links & Information
* [Install the Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
* [Manage Resource Group with Azure CLI](https://docs.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest)
* [Manage CosmosDB with Azure CLI](https://docs.microsoft.com/en-us/cli/azure/cosmosdb?view=azure-cli-latest)
* [Manage AKS with Azure CLI](https://docs.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest)

## Solution
If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command, a Pull Request with the files and instructions will be created for you. 

```
.workshop/workshop-step.ps1 Solution "MOVECLOUD-T001"
```

### Next Step
When you are done, move to the [next challenge](MOVECLOUD-T002.md)
