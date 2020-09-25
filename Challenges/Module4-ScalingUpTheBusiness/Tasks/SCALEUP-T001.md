# Scaling up the application
One of the customers of Fabrikam has launched a new vaccine and is organizing conferences all over the world. Because of the publicity around this new vaccine the number of people visiting the Conference websites are sky rocketing. This leads to unexpected behavior, downtime and slowness of the application. 

After looking at the deployed application, you notice that the web application and API are running as a a single instance with a low allocation of memory. Time to get this under control.

## Challenge
In this challenge you will use the scaling possibilities of Kubernetes to scale out your API and WEB application. Furthermore you will use the Helm charts to start an application with multiple pods. 

## Validation
* Scale up API to 5 pods using the `kubectl scale --replicas=5 deployment api`
* Scale up WEB to 5 pods using the `kubectl scale --replicas=5 deployment api`
* Change the API Helm chart to create 3 pods after deployment and deploy this
* When deploying new version of Helm Chart see that the application still runs

> Tips
> * Visit the Web application URL (public IP) /stats an refresh to see the IP address of the API change
> * Change the replicaCount in the values.yaml and run `helm upgrade api content-api` from the charts folder

# links
* https://github.com/microsoft/MCW-Cloud-native-applications/blob/master/Hands-on%20lab/HOL%20step-by-step%20-%20Cloud-native%20applications%20-%20Developer%20edition.md#task-1-increase-service-instances-from-the-kubernetes-dashboard

* https://github.com/microsoft/MCW-Cloud-native-applications/blob/master/Hands-on%20lab/HOL%20step-by-step%20-%20Cloud-native%20applications%20-%20Developer%20edition.md#task-2-increase-service-instances-beyond-available-resources

* https://github.com/microsoft/MCW-Cloud-native-applications/blob/master/Hands-on%20lab/HOL%20step-by-step%20-%20Cloud-native%20applications%20-%20Developer%20edition.md#task-3-restart-containers-and-test-ha