---
title: "Added Docker Compose files to deploy applications to Azure Web App (MOVECLOUD-T002 Solution)"
branch: users/patrick/docker-compose-webapp
commitmessage: "Added Docker Compose files to deploy applications to Azure Web App"
committer: Patrick O'Conell
committeremail: patrickoconnell@FabrikamMedical.example.org
linkedworkitem: module2
---

# Instructions to Fix the exercise
Added a new docker-compose file (docker-compose) to configure the multi-container web application. To deploy this file, update the name of the container registry and change the CosmosDB connection string

```powershell
$studentprefix = "your abbreviation here"
$resourcegroupName = "fabmedical-rg-" + $studentprefix
$webappName = "fabmedical-web-" + $studentprefix

$ghpat=Read-Host -Prompt "Github Personal Access Token"

az webapp config container set `
--docker-registry-server-password $ghpat `
--docker-registry-server-url https://ghcr.io `
--docker-registry-server-user notapplicable `
--multicontainer-config-file docker-compose-prod.yml `
--multicontainer-config-type COMPOSE `
--name $webappName `
--resource-group $resourcegroupName 
```
