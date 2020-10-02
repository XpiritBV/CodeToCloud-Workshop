$studentprefix = "your-name-here"
$resourcegroupName = "fabmedical-rg-" + $studentprefix
$dnsEntryName = "<dnsName>"


#Set up rights Helm repos
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo add jetstack https://charts.jetstack.io
helm repo update

#Install NGINX
helm install ingress-nginx/ingress-nginx --generate-name --namespace kube-system

#Create a DNS name for your NGINX public IP

#first get the IP address of the NGINX controller
kubectl get service --namespace kube-system
#then get the Public IP resource in Azure
az network public-ip list -o table
#and update the label of the IP Address
az network public-ip update --name <nameofpublicIP> -g <nameofresourcegroup> --dns-name $dnsEntryName


# Install the cert-manager
kubectl create namespace cert-manager
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.0.1 --set installCRDs=true

# Check there are cert-manager pods
kubectl get pods --namespace cert-manager

# Deploy the Certificate Authority that can issue certificates for the whole cluster
kubectl apply -f cluster-Issuer.yml

# Create a certificate for the dns address (dnsEntryName.region.cloudapp.azure.com)
kubectl apply -f certificate.yml

# Apply the certificate to the web app and api
kubectl apply -f content-ingress.yml

# Check if certificate is issued
kubectl describe certificate tls-secret
