---
title: Updated deployment file to be used with GitHub Actions (CLOSELOOP-T002)
branch: users/donovan/update-deployment-file
commitmessage: "Updated deployment file to be used with GitHub Actions :octocat:"
committer: Donovan Parker
committeremail: DonovanParker@FabrikamMedical.example.org
linktoworkitem: Module3
---
# Instructions to Fix the exercise

Modified the deployment script to have the prefix as a parameter and added the GitHub Secret environment variable instead of a local variable. To run the deployment locally, add a environment variable first that contains the GitHub Personal Access Token to pull images from the GitHub Container Registry


```PowerShell
# Personal Access Token should be pre-configured by setup.
# $env:CR_PAT="Your Pat Here" 
./infrastructure/deploy-infrastructure.ps1
```
