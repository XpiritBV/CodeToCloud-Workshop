# Module 0 - Introduction

Fabrikam Medical Conferences provides conference web site services tailored to the medical community. They started out 10 years ago building a few conference sites for a small conference organizer. Since then, word of mouth has spread, and Fabrikam Medical Conferences is now a well-known industry brand. They currently handle over 100 conferences per year and growing.

Websites for medical conferences are typically low budget web sites because the conferences usually have between 100 to 1500 attendees. At the same time, the conference owners have significant customization and change demands that require turnaround on a dime to the live sites. These changes can impact various aspects of the system from UI through to the back end, including conference registration and payment terms.

The VP of Engineering at Fabrikam, Susan Withers, has a team of 12 developers who handle all aspects of development, testing, deployment, and operational management of their customer sites. Due to customer demands, they have issues with the efficiency and reliability the conference websites. This mainly caused by an inefficient development and operations workflow.

In the current situation, the conference sites are hosted on-premises with the following topology and platform implementation:

* The conference web sites are built with the MEAN stack (Mongo, Express, Angular, Node.js).
* Web sites and APIs are hosted on Linux machines.
* MongoDB is also running on a separate cluster of Linux machines.

Customers are considered "tenants", and each tenant is treated as a unique deployment whereby the following happens:

* Each tenant has a database in the MongoDB cluster with its own collections.
* A copy of the most recent functional conference code base is taken and configured to point at the tenant database.
  * This includes a web site code base and an administrative site code base for entering conference content such as speakers, sessions, workshops, and sponsors.
* Modifications to support the customer's styles, graphics, layout, and other custom requests are applied to website and database.
* The tenant's code (conference and admin web site) is deployed to a specific group of load balanced Windows Server machines dedicated to one or more tenant. Each group of machines hosts a specific set of tenants, and this is distributed according to scale requirements of the tenant.
* Once the conference site is live, the inevitable requests for changes to the web site pages, styles, registration requirements, and any number of custom requests begin.

The conference owners have access to the admin site to enter event details and they will continue to use this admin site each conference, every year. They have the ability to add new events and isolate speakers, sessions, workshops, and other details.

## Problem situation

Susan is painfully aware that this small business, which evolved into something bigger, has organically grown into an unmanageable monolith. After some research and discussions with the lead architect, she comes to the conclusion that the current setup of the conference code base should be transformed into a fully, multi-tenanted application suite for conferences. However, with the high pace of change and the tight budgets, there is simply no have time to stop current business and restructure the core code base to support all the flexibility customers require.

Susan is looking to take a step in this direction with the following goals in mind:

* Improve the overall architecture
  * While multi-tenancy is a goal for the code base, even with this in place, Susan believes there will always be the need for custom copies of code for a particular tenant who requires a one-off custom implementation. Susan feels that Docker containers may be a good solution to support their short-term DevOps and development agility needs, while also being the right direction once they reach a majority multi-tenant application solution.
  * One of the issues with the code base is that it has many dependencies across features. Seemingly simple changes to an area of code introduce issues with layout, responsiveness, registration functionality, content refresh, and more. To avoid this, she would like to rework the core code base so that registration, email notifications and templates, content and configuration are cleanly separated from each other and from the front end.
  * Move towards a cloud native implementation of their conference solution, without a lot of rework, to ensure more cost efficiency and scalability.
* Improve the Development workflow
  * The time it takes to setup a development environment that resembles production is far too long
  * Feedback loops about the code quality need to be fast and frequent
* Improve the quality and maintainability of the code base
  * Every change needs to be reviewed by at least another developer
  * Reduce regressions introduced in a single tenant when changes are made.
* Improve the DevOps lifecycle.
  * The time it takes to onboard a new tenant, launch a new site for an existing tenant, and manage all the live tenants throughout the lifecycle of the conference is highly inefficient.
  * By reducing the effort to onboard customers, manage deployed sites, and monitor health, the company can contain costs and overhead as they continue to grow. This may allow for time to improve the multi-tenant platform they would like to build for long-term growth.
* Increase visibility into system operations and health.
  * Aggregate views of health across the web sites deployed

## Customer needs

To address the issues and progress towards the goals, Susan asks a high-end consultancy firm to help her. The first ask is to come up with a possible implementation for the goals that are set. Furthermore there are some requirements that need to be addresses in the proposed design.

* Reduce the overhead in time, complexity, and cost for deploying new conference tenants.
* Improve the reliability of conference tenant updates.
* Choose a suitable platform for their conference solution. The platform choice should:
  * Make it easy to deploy and manage infrastructure.
  * Provide tooling to help them with monitoring and managing container health and security.
  * Provide a vendor neutral solution so that a specific on-premises or cloud environment does not become a new dependency.
  * Start with Azure since that is already in their Enterprise Agreement
* Migrate data from MongoDB on-premises to CosmosDB with the least change possible to the application code.
* Make use of GitHub and / or Azure DevOps for Development Lifecycle
* Use Git repositories for source control and integrate into a CI/CD workflow.
* Embed code review and security scanning in to the development workflow
* Solution that does not incur a direct vendor-lock in
* As much re-use of existing code base
* Complete an implementation of the proposed solution for a single tenant to train the team and perfect the process.

## Tasks

* [Design Cloud Architecture and DevOps Roadmap for Fabrikam Medical Conferences](Tasks/INTRO-T001.md)
* [Present the solution to the Fabrikam Medical Conferences Board](Tasks/INTRO-T002.md)
