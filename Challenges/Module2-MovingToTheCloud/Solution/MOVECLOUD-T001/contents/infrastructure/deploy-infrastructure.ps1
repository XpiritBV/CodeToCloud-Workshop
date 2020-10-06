$studentprefix = "your abbreviation here"
$resourcegroupName = "fabmedical-rg-" + $studentprefix
$cosmosDBName = "fabmedical-cdb-" + $studentprefix
$aksName = "fabmedical-aks-" + $studentprefix
$location1 = "westeurope"
$location2 = "northeurope"

#Create an App Registration to use with AKS
$resultSPN = az ad sp create-for-rbac --name GitHubWorkshop | ConvertFrom-Json

#First create a group
$resultRG = az group create --name $resourcegroupName --location $location1 | ConvertFrom-Json

#Then create a CosmosDB
$resultCosmos = az cosmosdb create --name $cosmosDBName `
--resource-group $resourcegroupName `
--locations regionName=$location1 failoverPriority=0 isZoneRedundant=False `
--locations regionName=$location2 failoverPriority=1 isZoneRedundant=True `
--enable-multiple-write-locations `
--kind MongoDB `
| ConvertFrom-Json

#Create an AKS cluster
az aks create --resource-group $resourcegroupName `
  --name $aksName `
  --dns-name-prefix $aksName `
  --client-secret $($resultSPN.password) `
  --service-principal $($resultSPN.appId) `
  --generate-ssh-keys --location $location1 --node-count 3 `
  --kubernetes-version 1.18.8 --max-pods 100

az aks enable-addons -a monitoring -n $aksName -g $resourcegroupName
az aks enable-addons -a kube-dashboard -n $aksName -g $resourcegroupName


## Get Credentials
az aks get-credentials --name $aksName --resource-group $resourcegroupName

#remove and set rights
kubectl delete clusterrolebinding kubernetes-dashboard 
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard --user=clusterUser

## get the bearer token for the dashboard
cat ~/.kube/config

## Browse
az aks browse --name $aksName --resource-group $resourcegroupName
