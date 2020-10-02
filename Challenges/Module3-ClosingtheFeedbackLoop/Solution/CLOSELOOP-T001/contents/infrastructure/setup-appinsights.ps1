$studentsuffix = "rvo"
$resourcegroupName = "fabmedical-rg-" + $studentsuffix
$location1 = "westeurope"
$appInsights = "fabmedicalai-" + $studentsuffix


az extension add --name application-insights
$ai = az monitor app-insights component create --app $appInsights --location westeurope --kind web -g $resourcegroupName --application-type web --retention-time 120 | ConvertFrom-Json

Write-Host "AI Instrumentation Key=$($ai.instrumentationKey)"


