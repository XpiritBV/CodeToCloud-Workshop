# Step by Step SCALEUP-T001

In this task you will use the scaling possibilities of Kubernetes to scale out your API and WEB application. Furthermore you will use the Kubernetes deployment files to start an application with multiple pods. 

At this point, you have deployed a single instance of the web and API service containers. Now you will increase the number of container instances for the web service and scale the front-end on the existing cluster.

## Increase API instances from the Kubernetes dashboard

In this task, you will increase the number of instances for the API deployment in the Kubernetes management dashboard. While it is deploying, you will observe the changing status.

1. From your Codespace, start the tunnel to the Kubernetes cluster by using the following command, and navigate to the URL `https://<guid>.apps.codespaces.githubusercontent.com/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#/login`. Use `cat ~/.kube/config` to get your bearer token  

   ```PowerShell
   az aks browse --name $aksName --resource-group $resourcegroupName
   ```

2. From the navigation menu, select **Workloads** -\> **Deployments**, and then select the **API** deployment.

2. Select **SCALE**.

   ![In the Workloads > Deployments > api bar, the Scale icon is highlighted.](/Assets/image89.png)

3. Change the number of pods to **2**, and then select **OK**.

   ![In the Scale a Deployment dialog box, 2 is entered in the Desired number of pods box.](/Assets/image116.png)

   > **Note**: If the deployment completes quickly, you may not see the deployment Waiting states in the dashboard, as described in the following steps.

4. From the Replica Set view for the API, you will see it is now deploying and that there is one healthy instance and one pending instance.

   ![Replica Sets is selected under Workloads in the navigation menu on the left, and at right, Pods status: 1 pending, 1 running is highlighted. Below that, a red arrow points at the API deployment in the Pods box.](/Assets/image117.png)

5. From the navigation menu, select Deployments from the list. Note that the api service has a pending status indicated by the grey timer icon, and it shows a pod count 1 of 2 instances (shown as "1/2").

   ![In the Deployments box, the api service is highlighted with a grey timer icon at left and a pod count of 1/2 listed at right.](/Assets/image118.png)

6. From the Navigation menu, select Workloads. From this view, note that the health overview in the right panel of this view. You will see the following:

   - One deployment and one replica set are each healthy for the api service.

   - One replica set is healthy for the web service.

   - Three pods are healthy.

7. Navigate to the web application from the browser again. The application should still work without errors as you navigate to Speakers and Sessions pages.

   - Navigate to the /stats page. You will see information about the environment including:

     - **webTaskId:** The task identifier for the web service instance.

     - **taskId:** The task identifier for the API service instance.

     - **hostName:** The hostname identifier for the API service instance.

     - **pid:** The process id for the API service instance.

     - **mem:** Some memory indicators returned from the API service instance.

     - **counters:** Counters for the service itself, as returned by the API service instance.

     - **uptime:** The up time for the API service.

   - Refresh the page in the browser, and you can see the hostName change between the two API service instances. The letters after "api-{number}-" in the hostname will change.

## Increase WEB and API instances from the command line

1. In your Codespace terminal type the following command to find all deployments on your Kubernetes cluster

   ```
   kubectl get deployments
   ```

2. To scale the API deployment to 5 instances, type the following command

   ```
   kubectl scale --replicas=5 deployment web
   kubectl scale --replicas=5 deployment api
   ```

3. In the Kubernetes dashboard navigate to **Deployments** -\> **Pods** and check the api (or web depending on sequence of actions). It shows it dies not have enough CPU available. 

   ![](/Assets/NoCPU.png)

4. Scale down to 2 instances 

   ```
   kubectl scale --replicas=2 deployment web
   kubectl scale --replicas=2 deployment api
   ```

## Increase WEB and API instances from the deployment file

1. Open the web-deploy.yml file from the AKS folder
2. Update the following yaml snippet to set the number of replicas

   ```YAML
   spec:
     replicas: 5
     selector:
     matchLabels:
       app: web
     strategy:
   ```

3. Update the following snippet to update the CPU usage

   ```YAML
   resources:
      requests:
        cpu: 125m
        memory: 128Mi
   ```

4. Perform step 1-3 for api-deploy.yml as well
5. Check in your sources. The GitHub Action CI will trigger, and the new version will be deployed with the Continuous Delivery pipeline
6. To deploy the new version of the WEB and API manually, use the following command

   ```
   kubectl apply -f web-deploy.yml
   kubectl apply -f api-deploy.yml
   ```

> When you do not want to type all commands try the solution Pull Request by running

```
Workshop-Step Solution "ADVKUB-T001"
```
