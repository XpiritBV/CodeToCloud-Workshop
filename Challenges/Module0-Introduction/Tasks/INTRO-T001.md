# Design Cloud Architecture and DevOps Roadmap for Fabrikam Medical Conferences
You and your team are hired by Fabrikam Medical Conferences to help them with their cloud journey. Susan Withers, the VP of Engineering has contacted you and your form to help her to achieve her goals and objectives. She has asked you to design a solution and prepare a presentation to the target customer audience in a 15-minute chalk-talk format. One of you colleagues has a business design framework for this that he uses frequently to uncover the various needs.

## Challenge
In this challenge you will prepare a 15-minute chalk-talk style presentation to the customer. For this you need to design a proposed solution for Fabrikam Medical Conferences that covers the topics from the business design framework. Write your solution on a flipchart.

* Business needs
    * Who should you present this solution to? Who is your target customer audience? Who are the decision makers?
    * What customer business needs do you need to address with your solution?

* Design
    * High-level architecture
        * Would a microservices architecture be suitable?
        * What container solution would you propose to run the new microservices architecture for a single conference tenant?
        * Without getting into the details (the following sections will address the particular details), diagram your initial vision of the container platform, the containers that should be deployed (for a single tenant), and the data tier.

* Choosing a container platform on Azure
    * List the potential platform choices for deploying containers to Azure.
    * Which would you recommend and why?

* Code to Cloud 
    * Describe the high-level steps developers should follow to build and run containers on the selected container platform. Include the following components in the summary:
        * Local Development
        * The Git repository containing their source.
        * The Build process.
        * The Container Registry.
        * The Deployment Process.
        * The Release Process.
    * What options does the customer have for a Docker image registry and container scanning, and what would you recommend?

* Scalability considerations
    * Explain how we run all customer websites under their own url on the default ports (80/443) 
    * Explain how we deal with websites that are getting high-traffic or have peak traffic

* DevOps workflows
    * Describe how to set up continuous integration and deployment workflows 
    * Describe how to Infrastructure as Code can help Fabrikam to meet customer demand
    * Describe the recommended approach for keeping the container platform and code base up to date with the latest security patches 

When you are done with the design, review your design, considering the following questions:

* Identify any customer needs that are not addressed with the proposed solution.
* Identify the benefits of your solution.
* Determine how you will respond to the customer's objections.


## Links
* [Azure Kubernetes Services (AKS)](https://docs.microsoft.com/en-us/azure/aks/intro-kubernetes/)
* [Kubernetes](https://kubernetes.io/docs/home/)
* [AKS FAQ](https://docs.microsoft.com/en-us/azure/aks/faq)
* [Autoscaling AKS](https://github.com/kubernetes/autoscaler)
* [AKS Cluster Autoscaler](https://docs.microsoft.com/en-us/azure/aks/cluster-autoscaler)
* [Upgrading an AKS cluster](https://docs.microsoft.com/en-us/azure/aks/upgrade-cluster)
* [Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/)
* [Container Security](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-image-security/)
* [Image Quarantine](https://github.com/Azure/acr/tree/master/docs/preview/quarantine/)
* [Container Monitoring Solution](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/containers)