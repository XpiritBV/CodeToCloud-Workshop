# CodeToCloud with GitHub and Azure DevOps Workshop - Trainer Materials

This repository contains the trainer materials for a workshop targeted at students in a instructor-led training. The workshop focuses on the Code to Cloud journey. The journey includes the integration with Azure Boards, working with GitHub Codespaces, the GitHub Flow, and the GitHub Container Registry. Students will learn to use docker and docker-compose and deploy their solution to an Azure Web App using GitHub Actions, and Azure DevOps pipelines.

To make it challenging for the students, the workshop contains challenges that can also be done individually. To make sure students do not get stuck, there are scripts available with instructions to "automatically" fix a challenge, so students can continue. The workshop also contains extensive Step-By-Step videos and written instructions. There are also videos that explain the concepts that are used in the exercises.

This workshop focuses on the Code to Cloud journey. When you want to dive in to Cloud Native and the setup and configuration of Kubernetes, you can continue your learning journey with the [Cloud Native Workshop Workshop of Microsoft](https://github.com/microsoft/Cloud-Native-In-a-Day), which build upon the same sources. 

## Class setup

The class is primarily setup to let participants figure out how to perform the steps themselves and provides links to the relevant docs and tutorials to guide them on their way. While this can take significantly longer, it greatly improves the learning. Possibly more than a single day.

There is a guided step-by-step available as well which instructs the students exactly what to do in detail. Going through just the step-by-steps will be much faster.

Student must perform all modules in order.

When a student is unable to finish the module in time, they can run a tool to automatically perform the required code-changes on their environment, preparing them for the next module.

## Repository Setup

This repository is the "trainer" copy of the workshop. Including this repository, the workshop consists of 4 repositories that all have a specific purpose.

* [CodeToCloud-Student](https://github.com/XpiritBV/CodeToCloud-Student)
  * STUDENT REPOSITORY - This contains the exercises and challenges for the students. Provide this link to the students.
* [CodeToCloud-Source](https://github.com/XpiritBV/CodeToCloud-Source)
  * STUDENT REPOSITORY - This contains the starter solution source code that students can fork. Provide this link to the students.
* [CodeToCloud-Trainer](https://github.com/XpiritBV/CodeToCloud-Trainer)
  * TRAINER REPOSITORY - Current repository. This contains the trainer materials, slide decks, solution files and exercises
* [CodeToCloud-Solution](https://github.com/XpiritBV/CodeToCloud-Solution)
  * TRAINER REPOSITORY - This contains the Start and Solution files that are used in the auto-fix scripts. Should not be touched.

## Trainer Materials
There are trainer materials that can be used by the trainers to present the various concepts and agenda of the Day. These trainer materials can be found in the [Trainer Materials](/TrainerMaterials/README.md) folder. The [Outline presentation](TrainerMaterials\Presentations\OutlineOfTheDay.pptx) contains the agenda and introduction of the day to the students.

### Module 0 - Introduction

Duration: 120 minutes

To set the stage the students collaborate to use the different services of Azure, GitHub and Azure DevOps to design a architectural roadmap for Fabrikam Medical.

As facilitator you can have them read the instructions or role-play the part of VP of Engineering at Fabrikam, Susan Withers.

- [Instructions](Challenges/Module0-Introduction/Introduction.md)
- [Outline of the Day](TrainerMaterials/Presentations/OutlineOfTheDay.pptx)

### Prerequisites

Duration: 20 minutes

This workshop is targeted for students in a instructor-led training. To make it challenging for the students, the workshop contains challenges that can also be done individually. To make sure students do not get stuck, there are scripts available with instructions to "automatically" fix a challenge, so students can continue. The workshop also contains extensive Step-By-Step videos and written instructions. There are also videos that explain the concepts that are used in the exercises.

Students will be guided to clone the CodeToCloud source repository to their own account, setup Azure DevOps, create a GitHub Codespace and provision a settings file used to drive some of the automation.

- [Instructions](Challenges/Prerequisites/Readme.md)

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

[![Module 1 - Improving Developer Workflow - Theoretical Concepts](https://img.youtube.com/vi/EBNaQDY1-9g/0.jpg)](https://www.youtube.com/watch?v=EBNaQDY1-9g)

- [Concept Presentation](TrainerMaterials/Presentations/Module01-ImprovingDeveloperWorkflow.pptx)
- [Instructions](Challenges/Module1-ImprovingDeveloperFlow/ImprovingDeveloperWorkflow.md)
- [Step by Step Instructions](Challenges/Module1-ImprovingDeveloperFlow/Step-By-Step/Readme.md)


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

[![Module 2 - Moving to the Cloud - Theoretical Concepts](https://img.youtube.com/vi/S0fbsUHCpxE/0.jpg)](https://www.youtube.com/watch?v=S0fbsUHCpxE)

- [Concept Presentation](TrainerMaterials/Presentations/Module02-MovingToTheCloud.pptx)
- [Instructions](Challenges/Module2-MovingToTheCloud/MovingToTheCloud.md)
- [Step by Step Instructions](Challenges/Module2-MovingToTheCloud/Step-By-Step/Readme.md)

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

[![Module 3 - Closing the Feedback Loop - Theoretical Concepts](https://img.youtube.com/vi/MLO08rUiZ-k/0.jpg)](https://www.youtube.com/watch?v=MLO08rUiZ-k)

- [Concept Presentation](TrainerMaterials/Presentations/Module03-ClosingTheFeedbackLoop.pptx)
- [Instructions](Challenges/Module3-ClosingTheFeedbackLoop/ClosingTheFeedbackloop.md)
- [Step by Step Instructions](Challenges/Module3-ClosingTheFeedbackLoop/Step-By-Step/Readme.md)


## Class flow
 
  - [Module 0 - Introduction](/Challenges/Module0-Introduction/Introduction.md)
    - Introduction by Instructor
    - Introduction of Students
    - Design Cloud Architecture and DevOps Roadmap for Fabrikam Medical Conferences
    - Presentations
  
 - [Setup Prerequisites](/Challenges/Prerequisites/Readme.md)
 
 - [Module 1 - Improving the Developer Workflow](/Challenges/Module1-ImprovingDeveloperFlow/ImprovingDeveloperWorkflow.md)
   - Instruction by Instructor
   - Challenge
   - Presentation & Discussion

 - Lunch break

 - [Module 2 - Moving to the Cloud](/Challenges/Module2-MovingToTheCloud/MovingToTheCloud.md)
   - Instruction by Instructor
   - Challenge
   - Presentation & Discussion

 - [Module 3 - Closing the Feedback Loop](/Challenges/Module3-ClosingTheFeedbackLoop/ClosingTheFeedbackloop.md)
   - Instruction by Instructor
   - Challenge
   - Presentation & Discussion
 - Closing


## Challenges
All challenges can be found in the [Challenges](/Challenges/README.md) folder. These are also represented in another Git Repository that can be offered to the students. There is also a Git Repository that contains all sources. This can be found [here](https://github.com/XpiritBV/CodeToCloud-Source). Students need to fork this repo to get started. This is also described in the [prerequisites](Challenges/Prerequisites/Readme.md)

## Issues and pull requests
Issues and pull requests have been disabled for this repo. These can be added to the [parent repository](https://github.com/XpiritBV/CodeToCloud-Workshop) and will be reflected in this repo! 

Encourage students to leave feedback on the Workshop! This can be done along the way (when issues are encountered) and after finishing it. Feedback can be given in the CodeToCloud Workshop repository: https://github.com/XpiritBV/CodeToCloud-Workshop. This way we get a good idea of issues that were encountered by students, and the workshop can be further improved! They (and you) can also come up with enhancement proposals that would bring the workshop to a higher level!
![](Assets/CreateIssue.png)
![](Assets/IssueTemplate.png)

