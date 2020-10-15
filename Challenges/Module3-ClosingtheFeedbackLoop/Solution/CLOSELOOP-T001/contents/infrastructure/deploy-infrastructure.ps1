$studentprefix = "your abbreviation here"
$resourcegroupName = "fabmedical-rg-" + $studentprefix
$cosmosDBName = "fabmedical-cdb-" + $studentprefix
$webappName = "fabmedical-web-" + $studentprefix
$planName = "fabmedical-plan-" + $studentprefix
$location1 = "westeurope"
$location2 = "northeurope"
$appInsights = "fabmedicalai-" + $studentsuffix

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

#Create a Azure App Service Plan
az appservice plan create --name $planName --resource-group $resourcegroupName --sku S1 --is-linux

#Create a Azure Web App with NGINX container
az webapp create --resource-group $resourcegroupName --plan $planName --name $webappName -i nginx

#install AI extension
az extension add --name application-insights
$ai = az monitor app-insights component create --app $appInsights --location $location1 --kind web -g $resourcegroupName --application-type web --retention-time 120 | ConvertFrom-Json
Write-Host "AI Instrumentation Key=$($ai.instrumentationKey)"