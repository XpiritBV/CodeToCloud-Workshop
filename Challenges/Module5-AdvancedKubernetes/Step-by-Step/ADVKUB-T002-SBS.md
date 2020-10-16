# Step by Step SCALEUP-T002

In this task you need to set up the cluster set up in such a way, that it uses one IP address and DNS name and that all sites running on it are using https. You need to create a NGINX ingress controller on the cluster that receives a public IP address. The DNS of this IP address (`fabrikam-<dnsname>.region.cloudapp.azure.com`) needs to be used as entry point for all application and customers. 

1. Setting up an Ingress Controller and Certificate Manager can be done using standard packages and software that can be configured to serve your needs. A good way to serve pre-defined packages on a Kubernetes cluster are Helm charts. A Helm chart contains the containers, services and configuration that is needed to run a specific service. To be able to access Helm packages your need to configure the Helm CLI tool to access repositories where the Helm charts are stored. By default this is the official Helm "stable" repository. To add the default repository you can always use

    > ```
    > helm repo add stable https://kubernetes-charts.storage.googleapis.com/
    > ```

2. Add additional Helm repositories that contain the ingress controller and certificate manager. Open your terminal in your Codespace and execute the following command.

    ```powershell
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    helm repo add stable https://kubernetes-charts.storage.googleapis.com/
    helm repo add jetstack https://charts.jetstack.io
    helm repo update
    ```

3. First we need to install the Ingress Controller, that allows us to route traffic to the internal containers, using the same shared public IP address. To install the NGINX Ingress controller in the `kube-system` namespace, execute the following commands in your terminal.

    ```
    helm install ingress-nginx/ingress-nginx --generate-name --namespace kube-system
    ```

4. When the Ingress controller has been installed successfully, you need to map the public IP address of the Ingress controller, to the DNS name of your cluster. First you need to find the Public IP Address (`EXTERNAL-IP`)of the Ingress Controller. You can do this by running the following command.

    ```
    kubectl get service --namespace kube-system
    ```

    ![](/Assets/IngressIP.png)

5. When you have found the IP Address, you need to link this Public IP Address to a DNS name in Azure. You can do this by using the Azure Portal. In the Azure Portal, navigate to your resource group where the AKS cluster is really deployed. In the resource group view, search for your abbreviated name, you used when creating the Azure Resources. 

    ![](/Assets/2020-10-07-15-18-37.png)

    There you see 2 resource group. The resource group your created, and a "automatically created" resource group, that contains all cluster resources, like virtual machines, networks and public IP addresses. Open the "automatically created" resource group called something like `MC_fabmedical-rg-....` and open it. Find the resource of type Public IP Address and check the IP is the same as you found in step 4.

    ![](/Assets/publicIP.png)

    Click on Configuration, and configure the DNS Name label to set to your abbreviation 

    ![](/Assets/publicIPDNS.png)

6. Now that you have created a DNS name, making the cluster IP something like `yourname.westeurope.cloudapp.azure.com` you can link a certificate manager to issue certificates for this domain. In this step by step we use the cert-manager service that uses Let's Encrypt to issue certificates. Install the cert-manager on your cluster using the following commands.

    ```
    kubectl create namespace cert-manager
    helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.0.1 --set installCRDs=true
    ```

7. Before we continue we need to check if all cert-manager pods are installed and running. Use the following command to check this

    ```
    kubectl get pods --namespace cert-manager
    ```

The result should look similar like this

    ![](/Assets/cert-manager-pods.png)

8. Now that we have the cert-manager running, we need to deploy a Certificate Authority that can issue certificates for the whole cluster. In your Codespace create a new folder HELM and create a new file called cluster-issuer.yml. Add the following contents to this file. Replace the email address that you want to use with Let's Encrypt.

    ```YAML
    apiVersion: cert-manager.io/v1
    kind: ClusterIssuer
    metadata:
      name: letsencrypt-prod
    spec:
      acme:
        # You must replace this email address with your own.
        # Let's Encrypt will use this to contact you about expiring
        # certificates, and issues related to your account.
        email: ca@fabrikammedical.com
        server: https://acme-v02.api.letsencrypt.org/directory
        privateKeySecretRef:
          # Secret resource that will be used to store the account's private key.
          name: letsencrypt-prod
        # Add a single challenge solver, HTTP01 using nginx
        solvers:
        - http01:
            ingress:
              class: nginx
    ```

9. Deploy the issuer by running the following command

    ```
    kubectl apply -f cluster-issuer.yml
    ```

10. Now that we have a Certificate Authority, we need to create a certificate for our web application `yourname.westeurope.cloudapp.azure.com`). In the HELM folder, create a new file called `certificate.yml` and add the following contents. Change the dnsNames to your DNS name. 

    ```YAML
    apiVersion: cert-manager.io/v1
    kind: Certificate
    metadata:
      name: tls-secret
    spec:
      secretName: tls-secret
      dnsNames:
      - <dnsName>.westeurope.cloudapp.azure.com
      issuerRef:
        name: letsencrypt-prod
        kind: ClusterIssuer
    ```

    Deploy the file using the command 

    ```
    kubectl apply -f certificate.yml
    ```

11. Finally, you need to add the generated certificate to the Web Application and API in order to make the HTTPS. Create a new file called `content-ingress.yml` and add the following contents. Change the **hosts** and **host** to your DNS name. In the paths section you can see that the api can now be reached under the route `content-api`

    ```YAML
    apiVersion: networking.k8s.io/v1beta1
    kind: Ingress
    metadata:
      name: content-ingress
      annotations:
        kubernetes.io/ingress.class: nginx
        certmanager.k8s.io/cluster-issuer: letsencrypt-prod
        nginx.ingress.kubernetes.io/rewrite-target: /$1
    spec:
      tls:
        - hosts:
          - <dnsName>.westeurope.cloudapp.azure.com
          secretName: tls-secret
      rules:
        - host: <dnsName>.westeurope.cloudapp.azure.com
          http:
            paths:
              - path: /(.*)
                backend:
                  serviceName: web
                  servicePort: 80
              - path: /content-api/(.*)
                backend:
                  serviceName: api
                  servicePort: 3001         
    ```

    Deploy the file using the command 

    ```
    kubectl apply -f content-ingress.yml
    ```

12. Check if your certificates gets issues by executing the following command

    ```
    kubectl describe certificate tls-secret
    ```

    ![](/Assets/certs.png)

13.
    > When you do not want to type all commands try the solution Pull Request by running
    
    ```
    Workshop-Step Solution "ADVKUB-T002"
    ```

    > Troubleshoot the issuing of certificates https://cert-manager.io/docs/faq/troubleshooting/
