# CodeToCloud with GitHub and Azure DevOps Workshop

This repository contains all the materials for a workshop targeted at students in a instructor-led training. The workshop focusses on the Code to Cloud journey. The journey includes the integration with Azure Boards, working with GitHub Codespaces, the GitHub Flow, and the GitHub Container Registry. Students will learn to use docker and docker-compose and deploy their solution to an Azure Web App using GitHub Actions, and Azure DevOps pipelines.

To make it challenging for the students, the workshop contains challenges that can also be done individually. To make sure students do not get stuck, there are scripts available with instructions to "automatically" fix a challenge, so students can continue. The workshop also contains extensive Step-By-Step videos and written instructions. There are also videos that explain the concepts that are used in the exercises.

This workshop focusses on the Code to Cloud journey. When you want to dive in to Cloud Native and the setup and configuration of Kubernetes, you can continue your learning journey with the [Cloud Native Workshop Workshop of Microsoft](https://github.com/microsoft/Cloud-Native-In-a-Day), which build upon the same sources. 

## Setup

This repository is the "working" copy of the workshop. A pipeline `update-child-repos.yml` has been set up to create 3 repositories out of this working copy that can be used by the trainers and students of this workshop.

* [CodeToCloud-Student](https://github.com/XpiritBV/CodeToCloud-Student)
  * STUDENT REPOSITORY - This contains the exercises and challenges for the students. Provide this link to the students.
* [CodeToCloud-Source](https://github.com/XpiritBV/CodeToCloud-Source)
  * STUDENT REPOSITORY - This contains the starter solution source code that students can fork. Provide this link to the students.
* [CodeToCloud-Trainer](https://github.com/XpiritBV/CodeToCloud-Trainer)
  * TRAINER REPOSITORY - Current repository. This contains the trainer materials, slide decks, solution files and exercises
* [CodeToCloud-Solution](https://github.com/XpiritBV/CodeToCloud-Solution)
  * TRAINER REPOSITORY - This contains the Start and Solution files that are used in the auto-fix scripts. Should not be touched.


## Containers
In the Containers folder, you find 3 containers. 2 base containers and 1 container `ghws-fix` that does the actual work. The container uses the settings file of a student, that he or she can setup by running through the setup scripts, and creates a Pull Request in their forked repository with instructions and scripts to auto-fix or quickstart an exercise. The containers are published in a GitHub Action to the GitHub Container Registry of Xpirit.

## Module flow

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