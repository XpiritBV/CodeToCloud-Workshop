![Microsoft Cloud Workshops][logo]

<div class="MCWHeader1">
Code To Cloud - Preferred Solution for Fabrikam Medical Conferences
</div>

<div class="MCWHeader3">
October 2020
</div>

Information in this document, including URL and other Internet Web site references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2020 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at https://www.microsoft.com/en-us/legal/intellectualproperty/Trademarks/Usage/General.aspx are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners.

**Contents**

<!-- TOC -->

- [Cloud-native applications - Developer edition hands-on lab step-by-step](#cloud-native-applications---developer-edition-hands-on-lab-step-by-step)
  - [Abstract and learning objectives](#abstract-and-learning-objectives)
  - [Overview](#overview)
  - [Solution architecture](#solution-architecture)
  - [Requirements](#requirements)
  - [Exercise 1: Create and run a Docker application](#exercise-1-create-and-run-a-docker-application)
  - [Task 1: Test the application](#task-1-test-the-application)
  - [Task 2: Browsing to the web application](#task-2-browsing-to-the-web-application)
  - [Task 3: Create a Dockerfile](#task-3-create-a-dockerfile)
  - [Task 4: Create Docker images](#task-4-create-docker-images)
  - [Task 5: Run a containerized application](#task-5-run-a-containerized-application)
  - [Task 6: Setup environment variables](#task-6-setup-environment-variables)
  - [Task 7: Run several containers with Docker compose](#task-7-run-several-containers-with-docker-compose)
  - [Task 8: Push images to Azure Container Registry](#task-8-push-images-to-azure-container-registry)
  - [Task 9: Setup CI Pipeline to Push Images](#task-9-setup-ci-pipeline-to-push-images)
  - [Exercise 2: Deploy the solution to Azure Kubernetes Service](#exercise-2-deploy-the-solution-to-azure-kubernetes-service)
  - [Task 1: Tunnel into the Azure Kubernetes Service cluster](#task-1-tunnel-into-the-azure-kubernetes-service-cluster)
  - [Task 2: Deploy a service using the Kubernetes management dashboard](#task-2-deploy-a-service-using-the-kubernetes-management-dashboard)
  - [Task 3: Deploy a service using kubectl](#task-3-deploy-a-service-using-kubectl)
  - [Task 4: Deploy a service using a Helm chart](#task-4-deploy-a-service-using-a-helm-chart)
  - [Task 5: Initialize database with a Kubernetes Job](#task-5-initialize-database-with-a-kubernetes-job)
  - [Task 6: Test the application in a browser](#task-6-test-the-application-in-a-browser)
  - [Task 7: Configure Continuous Delivery to the Kubernetes Cluster](#task-7-configure-continuous-delivery-to-the-kubernetes-cluster)
  - [Task 8: Review Azure Monitor for Containers](#task-8-review-azure-monitor-for-containers)
  - [Exercise 3: Scale the application and test HA](#exercise-3-scale-the-application-and-test-ha)
  - [Task 1: Increase service instances from the Kubernetes dashboard](#task-1-increase-service-instances-from-the-kubernetes-dashboard)
  - [Task 2: Increase service instances beyond available resources](#task-2-increase-service-instances-beyond-available-resources)
  - [Task 3: Restart containers and test HA](#task-3-restart-containers-and-test-ha)
  - [Exercise 4: Working with services and routing application traffic](#exercise-4-working-with-services-and-routing-application-traffic)
  - [Task 1: Scale a service without port constraints](#task-1-scale-a-service-without-port-constraints)
  - [Task 2: Update an external service to support dynamic discovery with a load balancer](#task-2-update-an-external-service-to-support-dynamic-discovery-with-a-load-balancer)
  - [Task 3: Adjust CPU constraints to improve scale](#task-3-adjust-cpu-constraints-to-improve-scale)
  - [Task 4: Perform a rolling update](#task-4-perform-a-rolling-update)
  - [Task 5: Configure Kubernetes Ingress](#task-5-configure-kubernetes-ingress)
  - [After the hands-on lab](#after-the-hands-on-lab)

<!-- /TOC -->

## Overview

Fabrikam Medical Conferences (FabMedical) provides conference website services tailored to the medical community. They are refactoring their application code, based on node.js, so that it can run as a Docker application, and want to implement a solution that will help them get familiar with the development process, lifecycle of deployment, and critical aspects of the hosting environment. They will be deploying their applications to Azure Kubernetes Service and want to learn how to deploy containers in a dynamically load-balanced manner, discover containers, and scale them on demand.

## Solution architecture

Below is a diagram of the solution architecture that needs to be implemented at Fabrikam Medical Conferences. 

The solution will use Azure Kubernetes Service (AKS), which means that the container cluster topology is provisioned according to the number of requested nodes. The proposed containers deployed to the cluster are illustrated below with Cosmos DB as a managed service:

![A diagram showing the solution, using Azure Kubernetes Service with a Cosmos DB back end.](Assets/solution-topology.png)

Each tenant will have the following containers:

- **Conference Web site**: The SPA application that will use configuration settings to handle custom styles for the tenant.

- **Admin Web site**: The SPA application that conference owners use to manage conference configuration details, manage attendee registrations, manage campaigns, and communicate with attendees.

- **Registration service**: The API that handles all registration activities creating new conference registrations with the appropriate package selections and associated cost.

- **Email service**: The API that handles email notifications to conference attendees during registration, or when the conference owners choose to engage the attendees through their admin site.

- **Config service**: The API that handles conference configuration settings such as dates, locations, pricing tables, early-bird specials, countdowns, and related.

- **Content service**: The API that handles content for the conference such as speakers, sessions, workshops, and sponsors.

## Requirements

1. Microsoft Azure subscription must be pay-as-you-go or MSDN.

   - Trial subscriptions will _not_ work.

   - To complete this lab, ensure your account has the following roles:

   - The [Owner](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#owner)
     built-in role for the Azure Subscription you will use.

   - Is a [Member](https://docs.microsoft.com/azure/active-directory/fundamentals/users-default-permissions#member-and-guest-users) user in the Azure AD tenant you will use. (Guest users will not have the necessary permissions).

   > **Note** If you do not meet these requirements, you may have to ask another member user with subscription owner rights to login to the portal and execute the create service principal step ahead of time.

   - You must have enough cores available in your subscription to create the build agent and Azure Kubernetes Service cluster in Before the Hands-on Lab. You will need eight cores if following the exact instructions in the lab, or more if you choose additional cluster nodes or larger VM sizes. If you execute the steps required before the lab, you will be able to see if you need to request more cores in your sub.

2. Local machine or a virtual machine configured with:

   - A browser, preferably Chrome for consistency with the lab implementation tests.
   - [Angular CLI](https://angular.io/cli)
   - [Helm CLI](https://helm.sh/docs/intro/install/)
   - [Docker Desktop](https://www.docker.com/products/docker-desktop)
   - [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)

3. You will install other tools throughout the exercises.