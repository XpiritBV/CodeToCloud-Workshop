$studentprefix = "rvo"
$resourcegroupName = "CodeToCloud-" + $studentprefix
$cosmosDBName = "fabmedicaldb-" + $studentprefix
$aksName = "fabmedical-" + $studentprefix


#Create an App Registration to use with AKS
$resultSPN = az ad sp create-for-rbac --name GitHubWorkshop | ConvertFrom-Json

#First create a group
$resultRG = az group create --name $resourcegroupName | ConvertFrom-Json

#Then create a CosmosDB
$resultCosmos = az cosmosdb create --name $cosmosDBName `
--resource-group $resourcegroupName `
--locations regionName=westeurope failoverPriority=0 isZoneRedundant=False `
--locations regionName=northeurope failoverPriority=1 isZoneRedundant=True `
--enable-multiple-write-locations `
| ConvertFrom-Json

#Create an AKS cluster
az aks create --resource-group $resourcegroupName `
  --name $aksName `
  --dns-name-prefix $aksName `
  --client-secret $($resultSPN.password) `
  --service-principal $($resultSPN.appId) `
  --generate-ssh-keys --location westeurope --node-count 3 `
  --kubernetes-version 1.18.8 --max-pods 100

az aks enable-addons -a monitoring -n $aksName -g $resourcegroupName
az aks enable-addons -a kube-dashboard -n $aksName -g $resourcegroupName


## Get Credentials
az aks get-credentials --name $aksName --resource-group $resourcegroupName

#remove and set rights
kubectl delete clusterrolebinding kubernetes-dashboard 
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard --user=clusterUser

## Browse
az aks browse --name $aksName --resource-group $resourcegroupName
