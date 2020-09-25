cd ./content-web
npm install applicationinsights --save


$studentsuffix = "SUFFIX"
$resourcegroupName = "CodeToCloud-" + $studentsuffix
$cosmosDBName = "fabmedicalcdb-" + $studentsuffix
$aksName = "fabmedical-" + $studentsuffix
$appInsights = "fabmedicalai-" + $studentsuffix


az extension add --name application-insights
az monitor app-insights component create --app $appInsights --location westeurope --kind web -g $resourcegroupName --application-type web --retention-time 120


