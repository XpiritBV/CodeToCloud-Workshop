# CodeToCloud with GitHub and Azure DevOps Workshop - Trainer Materials

This repository contains the trainer materials for a workshop targeted at students in a instructor-led training. The workshop focusses on the Code to Cloud journey. The journey includes the integration with Azure Boards, working with GitHub Codespaces, the GitHub Flow, and the GitHub Container Registry. Students will learn to use docker and docker-compose and deploy their solution to an Azure Web App using GitHub Actions, and Azure DevOps pipelines.

To make it challenging for the students, the workshop contains challenges that can also be done individually. To make sure students do not get stuck, there are scripts available with instructions to "automatically" fix a challenge, so students can continue. The workshop also contains extensive Step-By-Step videos and written instructions. There are also videos that explain the concepts that are used in the exercises.

This workshop focusses on the Code to Cloud journey. When you want to dive in to Cloud Native and the setup and configuration of Kubernetes, you can continue your learning journey with the [Cloud Native Workshop Workshop of Microsoft](https://github.com/microsoft/Cloud-Native-In-a-Day), which build upon the same sources. 


## Class setup

The class is primarily setup to let participants figure out how to perform the steps themselves and provides links to the relevant docs and tutorials to guide them on their way. While this can take significantly longer, it greatly improves the learning. Possibly more than a single day.

There is a guided step-by-step available as well which instructs the students exactly what to do in detail. Going through just the step-by-steps will be much faster.

Student must perform all modules in order.

When a student is unable to finish the module in time, they can run a tool to automatically perform the required code-changes on their environment, preparing them for the next module.

## Class flow

 - Module 0 - Introduction
   - Introduction by Instructor
   - Introduction of Students
   - Design Cloud Architecture and DevOps Roadmap for Fabrikam Medical Conferences
   - Presentations

 - Setup Prerequisites

 - Module 1 - Improving the Developer Workflow
   - Instruction by Instructor
   - Challenge
   - Presentation & Discussion

 - Lunch break

 - Module 2 - Moving to the Cloud
   - Instruction by Instructor
   - Challenge
   - Presentation & Discussion

 - Module 3 - Closing the Feedback Loop
   - Instruction by Instructor
   - Challenge
   - Presentation & Discussion
 - Closing

## Challenges
All challenges can be found in the [Challenges](/Challenges/README.md) folder. These are also represented in another Git Repository that can be offered to the students. There is also a Git Repository that contains all sources. This can be found [here](https://github.com/XpiritBV/CodeToCloud-source).

## Trainer Materials
There are also trainer materials that can be used by the trainers to present the various concepts and agenda of the Day. These trainer materials can be found in the [Trainer Materials](/Trainer Materials/README.md) folder. 

### Module 0 - Introduction

Duration: 120 minutes

To set the stage the students collaborate to use the different services of Azure, GitHub and Azure DevOps to design a architectural roadmap for Fabrikam Medical.

As facilitator you can have them read the instructions or role-play the part of VP of Engineering at Fabrikam, Susan Withers.

[![Instructions](https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg)](https://www.youtube.com/watch?v=dQw4w9WgXcQ)

- [Instructions](Challenges/Module0-Introduction/Introduction.md)

### Prerequisites

Duration: 20 minutes

This workshop is targeted for students in a instructor-led training. To make it challenging for the students, the workshop contains challenges that can also be done individually. To make sure students do not get stuck, there are scripts available with instructions to "automatically" fix a challenge, so students can continue. The workshop also contains extensive Step-By-Step videos and written instructions. There are also videos that explain the concepts that are used in the exercises.

Students will be guided to clone the CodeToCloud source repository to their own account, setup Azure DevOps, create a GitHub Codespace and provision a settingsfile used to drive some of the automation.

[![Prerequisites Instructions](https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg)](https://www.youtube.com/watch?v=dQw4w9WgXcQ)

- [Instructions](Challenges/Prequisites/Readme.md)

### Module 1 - Improving the Developer Workflow

Duration: 120 minutes

#### Learning Objectives

In this module your students will learn to:

* Create a backlog of work with Azure Boards and relate that to your code
* Use Docker to containerize your code, to enable a consistent environment
* Use the GitHub workflow to work together on the same codebase
* Use Pull Requests to improve the quality of your code
* Set up a Continuous Integration build to quickly get feedback
* Use GitHub Security scanning tools to shift left security issues
* Use Docker Compose to create a environment that consists of multiple components

#### Available materials

Present the following topics to make the students familiar with:

- Introduction to GitHub Codespaces
- Introduction to Azure Boards and GitHub
- Visual Studio Code
- GitHub Flow
- Testing Locally
- Docker for a local production-like environment
- Pull-Requests
- GitHub Actions
- GitHub Packages
- Security Scanning
- Azure Pipelines

Or show the following video:

[![Prerequisites Instructions](https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg)](https://www.youtube.com/watch?v=dQw4w9WgXcQ)

- [Instructions](Challenges/Module1-ImprovingDeveloperFlow/ImprovingDeveloperWorkflow.md)

### Module 2 - Moving to the Cloud

Duration: 90 minutes

#### Learning Objectives

In this module your students will learn to:

* Use Infrastructure as Code to set up idempotent infrastructure in the cloud
* Set up a resource group in Azure and assign permissions
* Set up a CosmosDB via automation scripts
* Set up an Azure Web App that runs a multi-container application via automation scripts
* Set up a pipeline that deploys the infrastructure on demand

#### Available materials

Present the following topics to make the students familiar with:

- Infrastructure as Code
- Azure Fundamentals
- Azure Web Apps

Or show the following video:

[![Prerequisites Instructions](https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg)](https://www.youtube.com/watch?v=dQw4w9WgXcQ)

- [Instructions](Challenges/Module2-MovingToTheCloud/MovingToTheCloud.md)

### Module 3 - Closing the Feedback Loop

Duration: 120 minutes

#### Learning Objectives

In this module your students will learn to:

* Implement Application Insights in the application
* Monitor the containers and the platform
* Implement Continuous Delivery in GitHub Actions
* Set up a CI/CD pipeline with Azure DevOps to automatically deploy containers
* Set up an manual and automatic approval gate in the release pipeline, to control the release of new versions

#### Available materials

Present the following topics to make the students familiar with:

- Application Insights
- Azure Pipelines - Basics
- Azure Pipelines - Advanced: Stages, Environments & Checks

Or show the following video:

[![Prerequisites Instructions](https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg)](https://www.youtube.com/watch?v=dQw4w9WgXcQ)

- [Instructions](Challenges/Module3-ClosingTheFeedbackLoop/ClosingTheFeedbackloop.md)