$mongodbConnectionString="mongodb://<mongoDBConnectionstring>:10255/contentdb?ssl=true&replicaSet=globaldb"
$ghpat=Read-Host -Prompt "Github Personal Access Token"

kubectl create secret docker-registry pullsecret --docker-server=https://ghcr.io/ --docker-username=notneeded --docker-password=$ghpat
kubectl create secret generic cosmosdb --from-literal=db=$mongodbConnectionString
kubectl apply -f api-deploy.yml
kubectl apply -f api-service.yml
kubectl apply -f init-deploy.yml
kubectl apply -f web-deploy.yml
kubectl apply -f web-service.yml