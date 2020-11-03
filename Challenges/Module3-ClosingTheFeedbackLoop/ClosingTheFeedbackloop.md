# Module 3 - Closing the feedback loop

Susan is happy. The first website for a customer is running in the cloud. The development workflow to produce this application has been dramatically improved, and the application has been redesigned in such a way that the services run in separate containers. But, facing the brutal facts. This does not deliver any business value for the customer. For them, nothing changed. After running for a few days, the pilot customer reaches out and complains about an unstable website. Sometimes it works, sometimes it does not. Sometimes it is fast, sometimes it is not. 

Susan asks you and your team to help the DevOps team to fix this as soon as possible. Since this is new to most of the people on the team, people were not aware that they had tasks left after deployment of a service. Operations is something that is done by "others". After some quick reviews you notice a few important issues.

* There is no application and infrastructure logging available to determine issues
* The team deploys new versions of the application directly to production without any stage gates
* Deployment of containers is a manual action

Together with the DevOps team you need to address these issues ASAP!

## Learning Objectives

* Implement Application Insights in the application
* Monitor the containers and the platform
* Implement Continuous Delivery in GitHub Actions
* Set up a CI/CD pipeline with Azure DevOps to automatically deploy containers
* Set up an manual and automatic approval gate in the release pipeline, to control the release of new versions

## Tasks

* [CLOSELOOP-T001 Getting insights in to your application](Tasks/CLOSELOOP-T001.md)
* [CLOSELOOP-T002 Setup Continuous Deployment with GitHub Actions](Tasks/CLOSELOOP-T002.md)
* [CLOSELOOP-T003 Increase control with Azure DevOps CI/CD](Tasks/CLOSELOOP-T003.md)
* [CLOSELOOP-T004 Deploy latest validated version with automated approvals](Tasks/CLOSELOOP-T004.md)

