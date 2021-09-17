# Prerequisites for the Code To Cloud Workshop

This workshop is targeted for students in a instructor-led training. To make it challenging for the students, the workshop contains challenges that can also be done individually. To make sure students do not get stuck, there are scripts available with instructions to "automatically" fix a challenge, so students can continue. The workshop also contains extensive Step-By-Step videos and written instructions. There are also videos that explain the concepts that are used in the exercises.

# Video
If you rather watch a video with step by step instructions, you can do that here
[![Step by Step Video](https://img.youtube.com/vi/STzJSPvtim4/0.jpg)](https://www.youtube.com/watch?v=STzJSPvtim4)

## Code base

The workshop builds upon an existing code base. Before you start the workshop, this code base needs to be forked or cloned. 

1. Fork the [CodeToCloud-Source](https://github.com/xpiritbv/CodeToCloud-Source) Repo into a public repo on your own account.

## GitHub Codespace

The workshop is built with and targeted at development with GitHub Codespace. A full featured IDE in the cloud. In order to start working you need to create a Codespace.

1. Navigate to your forked repository on GitHub
2. Create a *Codespace* in your forked repo. This is done by pressing Code and going to the Codespaces tab.
![](/Assets/CodeSpace.png)

3. Your GitHub Codespace will be created

![](/Assets/Codespace-creation.png)

Visual Studio Code doesn't pass a couple of specific of keystrokes to the terminal, this may make it harder to quit docker once you've started a container interactively. You can add the [custom keybindings specified here](/.devcontainer/keybindings.json) to [your Visual Studio Code settings](https://code.visualstudio.com/docs/getstarted/keybindings#_advanced-customization). This remaps `ctrl-q` and `ctrl-p` when the terminal has focus.

## Set up workshop scripts

Furthermore, the workshop provides *Starter* and *Solution scripts*. These scripts are served as a Pull Request with instructions in your Git Repository. In order to make this work, and to make the scripts work we have set up a container and some helper scripts, that you can execute in the workshop. (How these scripts work exactly is described below in the section `Run Start and Solution Scripts`, first we have to set up the prerequisites for the workshop!).

To set this up, you need to perform these steps

* Setup your settings file and PowerShell Profile
* Create GitHub Personal Access Token
* Create Azure DevOps Personal Access Token

### Setup your settings file and PowerShell Profile

1. Open your GitHub Codespace
1. Open a powershell shell by typing `pwsh` in the terminal
1. Then run `.workshop/setup.ps1` which will ask for:
    1. The location of your repository
    2. Your GitHub Personal Access Token with the following scopes (see instructions below):
       * repo
       * read:packages
       * write:packages
       * read:org
       * workflow
    3. The name of your Azure DevOps organization
    4. Your Azure DevOps Personal Access Token with the following scopes:
       * Work Items: Read & Write
       * Build: Read & Execute
       * Project & Team: Read, Write & Manage
    5. The name of the Project in Azure DevOps. The project will be automatically created if it doesn't exist yet. If the students must use pre-created projects, make sure they are using the Basic Process for Azure Boards.
    6. Your unique suffix (short, only lower case letters). This will be used to create the name of the resource group and resources in Azure.
    7. Whether to create/recreate work items in Azure Boards to which the commits and pull-requests will be linked.

1. A local `settings.json` file has been created in the `.workshop` folder and is automatically ignored by git. **DO NOT COMMIT THIS TO YOUR REPO!**
1. This file is automatically loaded by the containers PowerShell Profile and pre-populates a number of global variables.

#### Create GitHub Personal Access Token

1. Login to your GitHub Account
1. Create a Personal Access Token as [described here](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token)
1. Keep this Personal Access token somewhere safe for later use. **DO NOT COMMIT THIS TO YOUR REPO!**

![Permissions GH](/Assets/Permissions-GH.png)

#### Create Azure DevOps Personal Access Token

1. Login to `https://dev.azure.com/youraccount` or create a new account on `https://dev.azure.com`
1. Create a Personal Access Token as [described here](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=preview-page)
1. Keep this Personal Access token somewhere safe for later use. **DO NOT COMMIT THIS TO YOUR REPO!**

## Run Start and Solution Scripts

When you go through the challenges or step by steps, you will see something like this

> This challenge needs some prerequisites. Run the following command in your PowerShell Terminal window of your GitHub 
> Codespace to set this up.

> Example:

> ```powershell
> Workshop-Step Start "DEVWF-T00X"
> ```

When you see this, execute the following steps

* In your Codespace, open a `pwsh` terminal
* Run the command specified, in this case `Workshop-Step Start "DEVWF-T00X"`. `T00X` will be specific to the current task you are working on.
* A Pull Request with scripts and instructions will be created for you.

You can open the pull request by following the link on the last line the logs:

```plain
git push origin users/donovan/update-deployment-file --force
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 32 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 1.21 KiB | 1.21 MiB/s, done.
Total 5 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
remote: 
remote: Create a pull request for 'users/donovan/update-deployment-file' on GitHub by visiting:
remote:      https://github.com/yourorganisation/CodeToCloud-Source/pull/new/users/donovan/update-deployment-file
remote:
remote:
remote:
remote: GitHub found 17 vulnerabilities on yourorganisation/CodeToCloud-Source's default branch (6 high, 4 moderate, 7 low). To find out more, visit:   
remote:      https://github.com/yourorganisation/CodeToCloud-Source/network/alerts
remote:
To https://github.com/yourorganisation/CodeToCloud-Source.git
 * [new branch]      users/donovan/update-deployment-file -> users/donovan/update-deployment-file
 
Creating pull request for users/donovan/update-deployment-file into main in yourorganisation/CodeToCloud-Source

https://github.com/yourorganisation/CodeToCloud-Source/pull/14
```

Similarly, solution scripts can be called when you get stuck on an exercise. When this is possible, this will be mentioned in the exercise!
```powershell
Workshop-Step Solution "DEVWF-T002"
```

## Variables

In some scripts we use variables like `$resourceGroupName` and `$webappName`. Based on the settings.json file, that is stored in your `.workshop` folder, we generated a PowerShell Profile for you. The values stored in `settings.json` are automatically loaded into your PowerShell console.

Available variables (loaded into `$global:` and `$env` scopes):

```powershell
$studentsuffix         # short lowercase string of letters unique to you.
$resourcegroupName     # the name of the resource group that will be created for you
$cosmosDBName          # the name of the cosmos db used by the webapp
$webappName            # web app service name
$planName              # web app service plan
$location1             # azure data center region
$location2             # azure data center region
$appInsights           # app insights instance name
$CR_PAT                # GitHub container registry access token
```

If you ever manually change the values in the `settings.json`, opening a fresh PowerShell terminal should load the new values automatically. Alternatively, run:

```powershell
Invoke-expression $profile
```

### Next Step

When you are done, move to the [first challenge](/Challenges/Module1-ImprovingDeveloperFlow/ImprovingDeveloperWorkflow.md)
