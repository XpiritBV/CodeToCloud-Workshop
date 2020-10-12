# Setup your codespace
1. Fork the [CodeToCloud-Source Repo] into your own account into a public repo.
1. Create a Code Space in your forked repo
![](CodeSpace.png)
1. Your GitHub Codespace will be created
![](Codespace-creation.png)

# Setup your workshop environment
1. Open your GitHub Codespace 
1. In the terminal type `pwsh`
1. Then run .workshop/setup.ps1 
    1. As part of the workflow you'll be asked to create a Personal Access Token for GitHub. For more information, see below.
    2. As part of the workflow you'll be asked to create a Personal Access Token for Azure DevOps. For more information, see below.
1. A local `settings.json` file has been created in the .workshop folder (DO NOT COMMIT THIS TO YOUR REPO!. Already in .gitignore file)
1. This file shall be used in later exercises

# Create GitHub Personal Access Token
1. Login to your GitHub Account
1. Create a Personal Access Token as [described here](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token)
1. Keep this Personal Access token somewhere safe for later use
[Permissions GH](Permissions-GH.png)

# Create Azure DevOps Token
1. Login to https://dev.azure.com/youraccount or create a new account on https://dev.azure.com
1. Create a Personal Access Token as [described here](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=preview-page)
1. Keep this Personal Access token somewhere safe for later use

# Questions to MS
1. Where do we host our repos? 
1. Where can we push our CodeSpace base container?
1. Where can we host the Gists?

# Questions to ourselves
1. Clean version of the CodeToCloud-Workshop repo without container/solutions 
1. Full version of the CodeToCloud-Workshop repo with container/solutions 

# Names
* Maria Santos -- Docker
* Josh Almond -- NPM