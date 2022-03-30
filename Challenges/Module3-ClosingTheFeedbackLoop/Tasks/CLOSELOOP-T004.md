# Deploy latest validated version with automated approvals

Everything is looking great. The Azure DevOps pipeline is running, and is building and pushing the latest version to the Azure WebApp. However, there is some confusion about the tag "latest". What is the latest version? Since the container images are also tagged with a build number, the team wants to make it explicit that the deployment uses the version instead of the latest version.

Furthermore, it happens that developers update the docker-compose file locally, to use their own container images, and sometimes this slips into the committed source code. The team wants to fix this to make the pipeline even more robust.

## Challenge

In this challenge you are going to replace the `:latest` tag in the docker-compose file with the build number from the pipeline. You will also add an automated check to the pipeline to validate if images are only coming from your own GitHub repository using an automated policy. 

## Validation

* Pipeline contains script to deploy versioned containers
* Production environment contains an [Evaluate Artifact] automated approval that checks if the container registry is on a whitelist

> Tips:
> Use the PowerShell task in the Azure Pipeline to replace the :latest tag in the docker-compose file with the version of the build
>
> ```YAML
> - powershell: (gc .\docker-compose.yml) -replace ':latest',':$(Build.BuildNumber)' | set-content .\docker-compose.yml
> ```

## Links & Information

* [Evaluate Artifact Policy](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/artifact-policy?view=azure-devops#check-allowed-registries)

## Solution

If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command from the PowerShell Terminal, a Pull Request with the files and instructions will be created for you. 

```powershell
Workshop-Step Solution "CLOSELOOP-T004"
```

To read or view a step by step explanation of this challenge, please visit [this page](/Challenges/Module3-ClosingTheFeedbackLoop/Step-By-Step/CLOSELOOP-T004-SBS.md)

### Next Step

Congratulations, you have completed the workshop!

Now that the Continuous Delivery pipeline has been set up, the product owner notices that changes, that she wants to announce all at once, are ending up straight into production. Even worse, some customers complain about these new features and unknown behavior. One of the developers mentions to start using feature flags to hide certain functionality. That is a great idea, but for now this is too much work and too complicated to set up. The team decides to set up a manual approval workflow to allow the product owner to approve changes before they end up in production. 

After some research they find that GitHub Actions is very good at automation and is more then sufficient for the developer workflow. But a more enterprise requirement, like adding approvals, is very hard with GitHub. You and your team advise to look at Azure DevOps again. Since all work is already registered there, it makes sense to build the build and release pipeline within Azure DevOps, and implement the manual approval. Furthermore, the integration between GitHub and Azure DevOps is great with the Azure Pipelines extension

