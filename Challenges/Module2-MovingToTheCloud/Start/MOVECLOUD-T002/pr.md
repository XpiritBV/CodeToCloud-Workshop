---
title: "Added 2 Kubernetes files to deploy API"
branch: users/patrick/kubernetes-files-api
commitmessage: "Added Kubernetes files to deploy API"
committer: Patrick O'Conell
committeremail: patrickoconnell@FabrikamMedical.example.org
linkedworkitem: module2
---
# Instructions to Start the exercise
Added Kubernetes files to deploy API. 

You need to add 2 secrets to kubernetes. One for the CosmosDB and one for the Github Container Registry. Make sure you add the /contentdb part to the MongoDB connectionstring. You can get the connectionstring from the Azure Portal

```
$mongodbConnectionString="mongodb://<mongoDBConnectionstring>:10255/contentdb?ssl=true&replicaSet=globaldb"
$ghpat="<fill in your github PAT here>"

kubectl create secret docker-registry pullsecret --docker-server=https://ghcr.io/ --docker-username=notneeded --docker-password=$ghpat
kubectl create secret generic cosmosdb --from-literal=db=$mongodbConnectionString
```

