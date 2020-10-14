---
title: "Added Infrastructure as Code file to provision Cloud Infra (SCALEUP-T001 Solution)"
branch: users/sharon/infrastructure-as-code
commitmessage: "Added Infrastructure as Code file to provision Cloud Infra :cloud:"
committer: Sharon Wang
committeremail: sharonwang@FabrikamMedical.example.org
linkedworkitem: module2
---
# Instructions to Fix the exercise

Added a PowerShell file to provision the cloud infrastructure. Please update the variables at top of the file so we do no conflict with each other

Don't forget to first logon to your cloud environment

```powershell
az login
```

```PowerShell
$studentprefix = "your-name-here"
$resourcegroupName = "fabmedical-rg-" + $studentprefix
$cosmosDBName = "fabmedical-cdb-" + $studentprefix
$aksName = "fabmedical-aks-" + $studentprefix
$location1 = "westeurope"
$location2 = "northeurope"
```

When browsing to the Kubernetes Dashboard from your Codespace, paste `/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#/login` after the URL that CodeSpaces generates for you

To login to your cluster you can use the bearer token. Use the command `cat ~/.kube/config` to show the contents of your Kubernetes configuration. You can find the token at the bottom of the file (`token: e07dcfb4...`)1

> Tip:
> You can use the Kubernetes extension in VSCode as well to see your AKS cluster resources
