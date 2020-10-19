---
title: Updated deployment file and GitHub Actions file (CLOSELOOP-T002)
branch: users/donovan/update-deployment-ghaction
commitmessage: "Updated deployment file and GitHub Actions file :octocat:"
committer: Donovan Parker
committeremail: DonovanParker@FabrikamMedical.example.org
linktoworkitem: Module3
---
# Instructions to Fix the exercise

Modified the deployment script to have the prefix as a parameter and added the GitHub Secret environment variable instead of a local variable. To run the deployment locally, add a environment variable first that contains the GitHub Personal Access Token to pull images from the GitHub Container Registry.

```PowerShell
# Personal Access Token should be pre-configured by setup.
# $env:CR_PAT="Your Pat Here" 
./infrastructure/deploy-infrastructure.ps1
```

Also modified the GitHub Action so that it deploys the latest version of the containers to the Azure WebApp. To run the pipeline added a GitHub Secret called `AZURE_CREDENTIALS`, that contains the secrets to deploy to the resource group. Run this snippet and paste completely in the secret value.

```PowerShell
$studentprefix ="your abbreviation here"
$resourcegroupName = "fabmedical-rg-" + $studentprefix 
$rg = az group show --name $resourcegroupName | ConvertFrom-Json
az ad sp create-for-rbac --name "codetocloud-$studentprefix" --sdk-auth --role contributor --scopes $($rg.id)
```

Copy the output as value of the GitHub Secret AZURE_CREDENTIALS