# Step by Step DEVWF-T004

If you rather watch a video with step by step instructions, you can do that here
[![Step by Step Video](https://img.youtube.com/vi/w80WzGtWpVc/0.jpg)](https://www.youtube.com/watch?v=w80WzGtWpVc)

In this task, you will merge the Pull Request containing 3 multi-staged Docker files to your main branch, while linking to an Azure Boards project. The multi-staged Docker files will be used to build a new version of your WEB, API and INIT container.

>This task has a Starter solution, that creates a Pull Request containing some files and instructions. 
>
> In order to run the automated Starter Solution, you need to go through the [Setup prerequisites](/Challenges/Prerequisites/Readme.md) first!

1. In your GitHub Codespace, run the starter solution in a PowerShell Terminal. A Pull Request with 3 Docker files will be created

      ```
      Workshop-Step Start "DEVWF-T004"
      ```

1. In your GitHub repository, navigate to the Tab Pull Requests and open the Pull Request with DEVWF-T004 in the title

      ![Shows the menu item for navigating to the Pull Request](/Assets/PullRequestDEVWF-T004.png)

1. In the Pull Request, check the conversation, Commits, Checks and Files Changed Tabs, and go through the instructions and changes.

1. On the Conversation Tab, press the Merge Pull Request Button, to merge the files in to the main branch. Link the Pull Request to your Azure Boards Work item for Module 1 by typing AB#Module1WorkItemID in the title or description of the Pull Request Commit Message. 

      ![Shows the button for merging a Pull Request in GitHub](/Assets/mergePullRequest.png)

Now your repository contains 3 new "multi-staged" docker file.

1. In your GitHub Codespace, update your files to the latest version by pulling them.

      ![](/Assets/2020-10-05-12-10-11.png)
Also you could use `git pull` from the command line.

1. Open your PowerShell terminal window. From the content-api folder containing the API application files and the new Dockerfile, type the following command to create a Docker image for the API application. 
      ```bash
      docker build -t fabrikam-api .
      ```
      This command does the following:
      - Executes the Docker build command to produce the image.
      - Tags the resulting image (`-t <name>`), in this case with the name content-api.
      - The final dot (`.`) indicates to use the Dockerfile in this current directory context. By default, this file is expected to have the name "Dockerfile" (case sensitive).



1. Do the same for the `content-web` and the `content-init` containers

      ```bash
      cd ../content-init
      docker build -t fabrikam-init .
   
      cd ../content-web
      docker build -t fabrikam-web .
      ```

1. Make sure you remove all running images to avoid conflict with ports in use. When you run `docker ps -a` you see all containers that are running or are stopped. Remove all containers, except the `mongo` container (and except the `cloudenvimage` container - in case this is shown - which contains your GitHub Codespace). The `mongo` container contains your populated database.

      ```
      docker rm -f <containername or id>
      ```

1. Run all containers and check whether the application still works as expected

      ```bash
      docker run -d --name api -p 3001:3001 --net fabrikam fabrikam-api
      docker run -d --name web -p 3000:80 --net fabrikam fabrikam-web
      ```

1. When you are done, commit and push your changes to your GitHub repository.

      ![Push from Visual Studio Code](/Assets/commitandpush.png)