$mongodbConnectionString="mongodb://fabmedicalcdb-rvo:Ws8E3lHP0n2CYmTJSknAQ2YK1MAwuLE1ejy4T5krT7H4NCdJccrmJepqdjIKn9teVqaAYbb42NhnApR0HI8IVw==@fabmedicalcdb-rvo.documents.azure.com:10255/contentdb?ssl=true&replicaSet=globaldb"

kubectl create secret generic cosmosdb --from-literal=db=$mongodbConnectionString
kubectl apply -f api-deploy.yml
kubectl apply -f api-service.yml
kubectl apply -f init-deploy.yml
kubectl apply -f web-deploy.yml
kubectl apply -f web-service.yml