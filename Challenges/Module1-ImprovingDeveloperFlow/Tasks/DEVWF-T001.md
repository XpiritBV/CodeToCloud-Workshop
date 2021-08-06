# DEVWF-T001 Get started with the work and create visibility

All developers at Fabrikam work for various customers at the same time. Many of them work on customizing and deploying the customer specific websites for the conferences. During the interviews it seemed that there is no central place for all the work that needs to be done or is in progress. This makes it very hard to see the status of a specific project or, in the current context, the status of the cloud transformation.

To overcome this lack of visibility the decision is made to create a separate repository for all the cloud transformation work and connect this with a KanBan board that contains all the work that needs to be done. To provide traceability between the requirements and the actual code changes, there needs to be an integration between the planned work and the commits in the Git repository.of what code changes are done

## Challenge

In this challenge you are going to use your [CodeToCloud-Source] repository that contains a copy of the current on-premises. This needs to be connected with an Azure Board in Azure DevOps to provide visibility about the work at hand. To ensure everything works a commit in the Git Repository (for example in the readme file) needs to be visible in the Work Item in Azure Boards and vice versa.

## Validation

- Azure Boards connected to the [CodeToCloud-Source] Git repository with [this extension](https://github.com/marketplace/azure-boards)
- 4 work items are present in Azure Boards. These are called [Module 1], [Module 2], [Module 3] and [Module 4]
- 1 commit in the Git repository linked to an Azure Boards (AB) work item 
    > Use `AB#<N>` in the commit message or description to link the commit to work item `<N>` (for instance  `AB#1`).

## Links & Information

* [Connect Azure Boards to GitHub Repository](https://github.com/marketplace/azure-boards)
* [Install and configure the Azure Boards app for GitHub](https://docs.microsoft.com/en-us/azure/devops/boards/github/install-github-app?view=azure-devops)
* [Link GitHub commits, pull requests, and issues to work items](https://docs.microsoft.com/en-us/azure/devops/boards/github/link-to-from-github?view=azure-devops)

## Solution

To read or view a step by step explanation of this challenge, please visit [this page](/Challenges/Module1-ImprovingDeveloperFlow/Step-By-Step/DEVWF-T001-SBS.md)

### Next Step

When you are done, move to the [next challenge](DEVWF-T002.md)
