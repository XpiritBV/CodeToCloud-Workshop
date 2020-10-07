# Limit of Public IP Addresses

The final step in the cloud journey is to make the cluster the single point of entry for Fabrikam Medical. To be a true multi-tenant application, Susan want to run all the websites of customers under the fabrikam domain. (e.g. https://fabrikam.com/customerx, https://fabrikam.com/customery), and all websites need to be secured with https. 

## Challenge

Susan asks you for one final advice. She needs to have the cluster set up in such a way, that it uses one IP address and DNS name and that all sites running on it are using https. You need to create a NGINX ingress controller on the cluster that receives a public IP address. The DNS of this IP address (fabrikam-<dnsname>.region.cloudapp.azure.com) needs to be used as entry point for all application and customers. 

The website needs to be reached under https://fabrikam-<dnsname>.region.cloudapp.azure.com and the api under fabrikam-<dnsname>.region.cloudapp.azure.com/content-api. To be able to serve the sites as https, you need to use the cert-manager to issue certificates. One of the infrastructure consultants already made a start with the installation scripts.

The steps that need to be followed are:

* Set up Helm repositories to get access to nginx and cert-manager helm charts
  * `helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx`
  * `helm repo add stable https://kubernetes-charts.storage.googleapis.com/`
  * `helm repo add jetstack https://charts.jetstack.io`
  * `helm repo update`
* Install NGINX in the kube-system workspace
* In Azure create a DNS name for your NGINX public IP (`fabrikam-<dnsname>.region.cloudapp.azure.com`)
* Install the cert-manager helm chart in the cert-manager namespace
* Deploy the Certificate Authority that can issue certificates for the whole cluster
* Create a certificate for the DNS address (`fabrikam-<dnsname>.region.cloudapp.azure.com`)
* Assign the certificates and routes to your application

## Links & Information

* [Install Nginx](https://github.com/kubernetes/ingress-nginx/tree/master/charts/ingress-nginx)
* [Install Cert Manager](https://cert-manager.io/docs/installation/kubernetes/)
* [Install and configure Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)

## Solution

If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command, a Pull Request with the files and instructions will be created for you. 

```powershell
.workshop/workshop-step.ps1 Solution "SCALEUP-T002"
```

## Extra

We need 1 enttrypoint
First we need to install an ingress controller that is able to rout the traffic interenally
We assovciate a DNS name to thhis public p of the ingress controller for easier access
We also need to have SSL cerficafes installes on all our services. Easiest way to do that is to do that on the ongress.. 
https://cert-manager.io/docs/installation/kubernetes/
 kubectl create namespace cert-manager
  helm repo add jetstack https://charts.jetstack.io
  helm repo update


https://github.com/kubernetes/ingress-nginx/tree/master/charts/ingress-nginx
helm install ingress-nginx/ingress-nginx --generate-name --namespace kube-system


helm install cert-manager jetstack /cert-manager --namespace cert-manager --version v1.0.1 --set installCRDs=true

https://cert-manager.io/docs/
https://cert-manager.io/docs/installation/kubernetes/