---
title: "Changed Kubernetes files to Deploy 5 pods (SCALEUP-T001 Solution)"
branch: users/patrick/kubernetes-files-scaled
commitmessage: "Changed Kubernetes files to Deploy 5 pods"
committer: Patrick O'Conell
committeremail: patrickoconnell@FabrikamMedical.example.org
linkedworkitem: module4
---

Created the 2 deployment files for a structural solution to create 5 pods when starting the application.

Please run following commands to deploy

```
kubectl apply -f api-deploy.yml
kubectl apply -f web-deploy.yml
```

When needed you can also scale manually using the commands 

```
kubectl scale --replicas=5 deployment web
kubectl scale --replicas=5 deployment api
```