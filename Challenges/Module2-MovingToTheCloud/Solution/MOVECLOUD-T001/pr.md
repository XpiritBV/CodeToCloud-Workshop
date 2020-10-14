---
title: "Added Infrastructure as Code file to provision Cloud Infra (MOVECLOUD-T001 Solution)"
branch: users/sharon/infrastructure-as-code
commitmessage: "Added Infrastructure as Code file to provision Cloud Infra :cloud:"
committer: Sharon Wang
committeremail: sharonwang@FabrikamMedical.example.org
linkedworkitem: module2
---
# Instructions to Fix the exercise

Added a PowerShell file to provision the cloud infrastructure. Please update the variables on top of the file so we do no conflict with each other

Don't forget to login first in your cloud environment

```powershell
az login
```

```PowerShell
$studentprefix = "your abbreviation here"
$resourcegroupName = "fabmedical-rg-" + $studentprefix
$cosmosDBName = "fabmedical-cdb-" + $studentprefix
$webappName = "fabmedical-web-" + $studentprefix
$planName = "fabmedical-plan-" + $studentprefix
$location1 = "westeurope"
$location2 = "northeurope"
```

