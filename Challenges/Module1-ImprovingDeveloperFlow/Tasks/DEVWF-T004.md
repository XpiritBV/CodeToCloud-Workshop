# DEVWF-T004 Optimize containers with a multi staged Docker File

Now that the complete application runs in Docker containers, development speeds is ramping up. Developers run multiple versions of the application side by side and they build new versions when needed. One of the developers notices that the size of the Docker images are quite large. After some investigation it seems that the images contain the complete SDK and supporting files to build the application. During runtime these files are not needed. Besides that, the container images contains many SDK files that contain security vulnerabilities. 

You and your team advice to start using multi staged Docker files. This way you can use containers to build the application and use a lighter version of the container to run the application. Besides that, you advice the team to start working with Pull Requests to share and review code, instead of the Gists that were shared earlier.

To help them out your team creates a Pull Request that contains the multi staged Docker file for the WEB, API and INIT applications.

## Before you start this challenge

This challenge needs some prerequisites. Run the following command in your Powershell Terminal window of your GitHub Codespace to set this up.

```powershell
Workshop-Step Start "DEVWF-T004"
```

## Challenge

In this challenge you will merge the Pull Request [Example for Multi-Staged Docker Files :whale: (DEVWF-T004)] to the main branch and link this to the Azure Boards Work Item [Module 1]. This PR contains 3 multi staged Docker file. Re-Build the WEB, API and INIT application and run the WEB and API container and check the differences. Also run `docker images` to see the difference in image size.

## Validation

* Pull Request has been created and merged
* Main branch contains multi staged Docker files
* Pull Request has been linked to Azure Boards Work Item (link with AB#WorkItemID)
* New Container for WEB, API and INIT built and run

> Tip
> If you get merge conflicts while pulling, solve the merge conflicts by pressing "Accept incoming change in VsCode"
>
> Use the `docker ps -a` command to see which containers are running and stopped on your system
>
> Use the `docker rm` command to remove containers that have run earlier
>
> Link a Work item to a Pull Request or Commit by adding AB#<workitemid> to your title or description.

## Links & Information

* [Link GitHub commits, pull requests, and issues to work items](https://docs.microsoft.com/en-us/azure/devops/boards/github/link-to-from-github?view=azure-devops)
* [Use multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/)
* [Creating a Pull Request](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)

## Solution

To read or view a step by step explanation of this challenge, please visit [this page](/Challenges/Module1-ImprovingDeveloperFlow/Step-By-Step/DEVWF-T004-SBS.md)

### Next Step

When you are done, move to the [next challenge](DEVWF-T005.md)
