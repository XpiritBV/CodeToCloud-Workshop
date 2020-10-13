# Step by Step SCALEUP-T001

In this task you are going to create cloud infrastructure, so that your application can run on a cluster in the cloud. For this task we are going to create:

* An **Azure Resource Group** that will serve as the container that contains the resources
* A CosmosDB with Mongo API that can serve as your database
* An Azure Kubernetes Cluster (AKS) that can serve your application as containers
* A Service Principal that allow you to connect to the Azure Resources
* Some Add-Ons to Kubernetes to provide dashboard and monitoring capabilities

We can create all these resources manually, but since we want to do this "the DevOps way", we are going to create all resources as Infrastructure as Code. In this Step by Step we chose to create all resources with the Azure CLI.

## Prepare your Codespace

1. From your GitHub repository open your Codespace

   ![](/Assets/OpenCodeSpace.png)

2. In the file explorer, create a new folder called `infrastructure`

3. Create a new file called `deploy-infrastructure.ps1`

   ![](/Assets/newfolderinfra.png)

4. To make automation of all resources a bit easier, add these variables in the `deploy-infrastructure.ps1`file

   ```Powershell
   $studentprefix = "Your 3 letter abbreviation here"
   $resourcegroupName = "fabmedical-rg-" + $studentprefix
   $cosmosDBName = "fabmedical-cdb-" + $studentprefix
   $aksName = "fabmedical-aks-" + $studentprefix
   $location1 = "westeurope" #change if needed
   $location2 = "northeurope" #change if needed
   ```

## Create an Azure Resource Group

Create an Azure Resource Group to hold the resources that you create in this hands-on lab. 

1. In the `deploy-infrastructure.ps1` file add a Azure CLI command to create a resource group 

   ```PowerShell
   az group create -l $location1 -n $resourcegroupName
   ```

   - **Location:** Choose a region where all CosmosDB and AKS SKUs are available. , which is currently: Canada Central, Canada East, North Central US, Central US, South Central US, East US, East US 2, West US, West US 2, West Central US, France Central, UK South, UK West, North Europe, West Europe, Australia East, Australia Southeast, Brazil South, Central India, South India, Japan East, Japan West, Korea Central, Southeast Asia, East Asia, and remember this for future steps so that the resources you create in Azure are all kept within the same region.

2. Save the powershell file and run it from the terminal:

      ```powershell
      pushd infrastructure
      ./deploy-infrastructure.ps1
      ```

3. When this completes, the Azure Portal shows your Resource Group.

   ![Resouce group created](/Assets/2020-10-09_16-36-24.png) 

   ![In this screenshot of the Azure Portal, the fabmedical- Resource group is listed.](/Assets/b4-image8.png)

### Create a Service Principal

Azure Kubernetes Service requires an Azure Active Directory service principal to interact with Azure APIs. The service principal is needed to dynamically manage resources such as user-defined routes and the Layer 4 Azure Load Balancer. 

> **Note**: To complete this task, ensure your account is an [Owner](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#owner) built-in role for the subscription you use and is a [Member](https://docs.microsoft.com/azure/active-directory/fundamentals/users-default-permissions#member-and-guest-users) user in the Azure AD tenant you use. You may have trouble creating a service principal if you do not meet these requirements.

1. To create a service principal, add the following command in the `deploy-infrastructure.ps1` file. The output of this command will be stored in a variable for later use.

   ```Powershell
   $resultSPN = az ad sp create-for-rbac --name http://GitHubWorkshop | ConvertFrom-Json
   $resultSPN
   ```

2. Run the powershell again. The command produces output like this. Save this for later use.

   ```powershell
   ./deploy-infrastructure.ps1
   ```

   ```bash
   appId     : 272c402c-xxxx-xxxx-xxxx-xxxxxxxxxxxx
   displayName : GitHubWorkshop
   name    : http://GitHubWorkshop
   password  : xxxxXXXX.xxxx0000XXXX0000xxxx00
   tenant    : ed6acf0d-xxxx-xxxx-xxxx-xxxxxxxxxxxx
   ```

### Create a CosmosDB

Azure CosmosDB is a geo-replicated database service running in Azure. This can also be created from the Azure CLI 

1. In your `deploy-infrastructure.ps1` file add the following command

   ```powershell
   #Then create a CosmosDB
   $resultCosmos = az cosmosdb create --name $cosmosDBName `
   --resource-group $resourcegroupName `
   --locations regionName=$location1 failoverPriority=0 isZoneRedundant=False `
   --locations regionName=$location2 failoverPriority=1 isZoneRedundant=True `
   --enable-multiple-write-locations `
   --kind MongoDB `
   | ConvertFrom-Json
   ```

   > This creates a CosmosDB with 2 failover location with a MongoDB API. 

2. The command produces output like this. 

   ```bash
   apiProperties            : @{serverVersion=3.2}
   capabilities             : {}
   connectorOffer           : 
   consistencyPolicy          : @{defaultConsistencyLevel=Session; maxIntervalInSeconds=5; maxStalenessPrefix=100}
   cors                 : {}
   databaseAccountOfferType       : Standard
   disableKeyBasedMetadataWriteAccess : False
   documentEndpoint           : https://fabmedical-cdb-sbs.documents.azure.com:443/
   ...
   ```

### Create a Azure Kubernetes Service cluster

In this section, you create and configure an Azure Kubernetes Services (AKS) cluster with the Azure CLI command line tool.

1. In your `deploy-infrastructure.ps1` file add the following command

   ```powershell
   #Then create a CosmosDB
   az aks create --resource-group $resourcegroupName `
   --name $aksName `
   --dns-name-prefix $aksName `
   --client-secret $($resultSPN.password) `
   --service-principal $($resultSPN.appId) `
   --generate-ssh-keys --location $location1 --node-count 3 `
   --kubernetes-version 1.18.8 --max-pods 100
   ```

   > This creates an AKS cluster in your resourcegroup containing 3 worker nodes. It uses the appID and secret of the SPN that was created earlier in the step by step. The version of the cluster is 1.18.8. To update to a later version run the command `az aks get-versions` to see the available versions in your region.

2. Because `az ad sp create-for-rbac` resets the credentials each time it's run, we need to update the credentials on the cluster in case you re-run the script. Add the command to reset the credentials **above** the `az aks create` command you've just added.

   ```powershell
   # Reset credentials to make sure the credentials match the ones that were reset above.
   az aks update-credentials `
   --resource-group $resourcegroupName `
   --name $aksName `
   --reset-service-principal `
   --service-principal $($resultSPN.appId) `
   --client-secret $($resultSPN.password)
   ```

## Configure the cluster

In this task, you will gather the information you need about your Azure Kubernetes Service cluster to connect to the cluster and execute commands to connect to the Kubernetes management dashboard.

1. First you need to install 2 add-ons to the cluster to enable monitoring and dashboards. Add the following commands to the `deploy-infrastructure.ps1` file to install the add-ons.

   ```powershell
   az aks enable-addons -a monitoring -n $aksName -g $resourcegroupName
   az aks enable-addons -a kube-dashboard -n $aksName -g $resourcegroupName
   ```

   > *Note: The kube-dashboard is deprecated and is partially replaced by the Azure Portal. You can also use the Kubernetes extension in your Codespace to connect to the cluster or use a third-party tool like "Lens". For clarity and backward compatibility we will use the kube-dashboard add-on in this step by step.

2. To be able to connect to the cluster, credentials to connect, should be added to your local `.kube.config`. When you use the GitHub Codespace, this is the `.kube.config` within the Codespace. To store the credentials in your `.kube.config` add the following command to the `deploy-infrastructure.ps1` file

   ```powershell
   az aks get-credentials --name $aksName --resource-group $resourcegroupName
   ```

3. After installing the plugins, permissions need to be set to the dashboard. Add the following command to the `deploy-infrastructure.ps1` file

   ```powershell
   kubectl delete clusterrolebinding kubernetes-dashboard 
   kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard --user=clusterUser
   ```

## Create the infrastructure from script

1. In your terminal window of the Codespace, open a PowerShell terminal by typing `pwsh` and run the `az login` command to login to your azure subscription

   ```powershell
   az login
   ```

2. After logging in, run the `deploy-infrastructure.ps1` file.

   ```powershell
   ./infrastructure/deploy-infrastructure.ps1
   ```

## Connect to the cluster

To be able to see containers and perform administrative tasks, you need to connect to the cluster. 

### Using the Kubernetes dashboard

1. To login to the dashboard, you need a bearer authentication token. This is stored in the `.kube.config` file. To retrieve the token, open your terminal in your Codespace and type

   ```bash
   cat ~/.kube/config
   ```

2. You will see output like this. Copy the value of the AKS token for later use.
   ![In this screenshot you see the output of the .kube.config file and show the value of the token](/Assets/AKSToken.png)

3. Open the dashboard by running the following command in your terminal

   ```powershell
   az aks browse --name $aksName --resource-group $resourcegroupName
   ```

4. In the remote explorer, find the forwarded port 8001 and click the globe icon to open the dashboard.
   ![](/Assets/forwardedKubePort.png)

5. When browsing to the Kubernetes Dashboard from your Codespace, the browser shows plain json output. Paste `/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#/login` after the URL that CodeSpaces generates for you. The URL looks like this 

   ```
   https://<guid>-8001.apps.codespaces.githubusercontent.com/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#/login
   ```

6. In the login window, paste the AKS token you retrieved from the `.kube.config` file
   ![](/Assets/loginaks.png)

### Using Codespaces

1. You can also log in to AKS from your Codespace. Open the Kubernetes Add-On in your Codespace
   ![](/Assets/codespaceaks.png)

2. When your cluster does not appear, run the following command to add the cluster to your `.kube.config`

   ```powershell
   az aks get-credentials --name $aksName --resource-group $resourcegroupName
   ```

3. When you are done, commit and push your changes to your GitHub repository.

    ![](/Assets/2020-10-05-12-10-11.png)


> When you do not want to type all commands try the solution Pull Request by running

```
.workshop/workshop-step.ps1  Solution "SCALEUP-T001"
```
