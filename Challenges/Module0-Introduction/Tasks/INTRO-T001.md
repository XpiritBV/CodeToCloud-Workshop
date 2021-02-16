# Design Cloud Architecture and DevOps Roadmap for Fabrikam Medical Conferences

You and your team are hired by Fabrikam Medical Conferences to help them with their cloud journey. Susan Withers, the VP of Engineering has contacted you and your form to help her to achieve her goals and objectives. She has asked you to design a solution and prepare a presentation to the target customer audience in a 15-minute chalk-talk format. One of you colleagues has a business design framework for this that he uses frequently to uncover the various needs.

## Challenge

In this challenge you will prepare a 15-minute chalk-talk style presentation to the customer. For this you need to design a proposed solution for Fabrikam Medical Conferences that covers the topics from the business design framework. Write your solution on a flipchart. 

Think of the following topics you need to cover.

* Business needs
  * Who should you present this solution to? Who is your target customer audience? Who are the decision makers?
  * What customer business needs do you need to address with your solution?

* Design
  * High-level architecture
    * Would a micro services architecture be suitable?
    * What container solution would you propose to run the new micro services architecture for a single conference tenant?

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
  * What options does the customer have for a Docker image registry and security scanning, and what would you recommend?

* DevOps workflows
  * Describe how to set up continuous integration and deployment workflows 
  * Describe how to Infrastructure as Code can help Fabrikam to meet customer demand
  * Describe the recommended approach for keeping the container platform and code base up to date with the latest security patches 

## Links & Information

* [What is a Container?](https://www.docker.com/resources/what-container)
* [Web Apps in Containers](https://azure.microsoft.com/en-us/services/app-service/containers/)
* [GitHub Actions](https://github.com/features/actions)
* [GitHub Security Features](https://github.com/features/security)
* [GitHub Flow](https://guides.github.com/introduction/flow/)
* [GitHub Packages](https://github.com/features/packages)
* [GitHub Container Registry](https://docs.github.com/en/free-pro-team@latest/packages/getting-started-with-github-container-registry/about-github-container-registry)
* [Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/)
* [Container Monitoring Solution](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/containers)