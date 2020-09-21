## Optimize containers with a multi staged Docker File
Now that the complete application runs in Docker containers, development speeds is ramping up. Developers run multiple versions of the application side by side and they build new versions when needed. One of the developers notices that the size of the Docker images are quite large. After some investigation it seems that the images contain the complete SDK and supporting files to build the application. During runtime these files are not needed. Besides that, the container images contains many SDK files that contain security vulnerabilities. 

You and your team advice to start using multi staged Docker files. This way you can use containers to build the application and use a lighter version of the container to run the application. Besides that, you advice the team to start working with Pull Requests to share and review code, instead of the Gists that were shared earlier.

To help them out you create a Pull Request that contains the multi staged Docker file for both the web and api.

## Challenge
In this challenge you will merge the branch DEVWF-T004 with a Pull Request to the master branch and link this to the Azure Boards Work Item [Module 1]. This contains 2 multi staged Docker file. Re-Build and run the Web and API container and check the differences

## Validation
* Pull Request has been created and merged
* Master branch contains multi staged Docker file
* Pull Request has been linked to Azure Boards Work Item (link with AB#WorkItemID)
* New Container for Web and API built

## Links
* [Link GitHub commits, pull requests, and issues to work items](https://docs.microsoft.com/en-us/azure/devops/boards/github/link-to-from-github?view=azure-devops)
* [Use multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/)
* [Creating a Pull Request](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)

## Step by Step Explanation


