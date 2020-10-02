---
title: "Added Kubernetes files to deploy applications (MOVETOCLOUD-T002 Solution)"
branch: users/patrick/kubernetes-files
commitmessage: "Added Kubernetes files to deploy applications"
committer: Patrick O'Conell
committeremail: patrickoconnell@FabrikamMedical.example.org
linkedworkitem: module2
---
# Instructions to Fix the exercise
Added all kubernetes files to deploy INIT, WEB and API. 

You need to add 2 secrets to kubernetes. One for the CosmosDB and one for the Github Container Registry. Make sure you add the /contentdb part to the mongoDB connectionstring. You can get the connectionstring from the Azure Portal

```
$mongodbConnectionString="mongodb://<mongoDBConnectionstring>:10255/contentdb?ssl=true&replicaSet=globaldb"
$ghpat="<fill in your github PAT here>"

kubectl create secret docker-registry pullsecret --docker-server=https://ghcr.io/ --docker-username=notneeded --docker-password=$ghpat
kubectl create secret generic cosmosdb --from-literal=db=$mongodbConnectionString
```

