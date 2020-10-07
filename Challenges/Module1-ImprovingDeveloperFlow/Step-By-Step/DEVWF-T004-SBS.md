# Step by Step DEVWF-T004

In this task, you will merge the Pull Request containing create 3 multi-staged Dockerfiles to your main branch, while linking to an Azure Boards project. The multi-staged Docker files will be used to build a new version of your WEB, API and INIT container.

>This task has a Starter solution, that creates a Pull Request containing some files and instructions. 
>
> In order to run the automated Starter Solution, you need to go through the [Setup prerequisites]../../../Challenges/Prequisites/RunThroughSetup.md) first!

1. In your GitHub Codespace, open a Powershell Terminal and run the starter solution. A Pull Request with 3 Dockerfiles will be created

```
.workshop/workshop-step.ps1  Start "DEVWF-T004"
```

2. In your GitHub repository, navigate to the Tab Pull Requests and open the Pull Request with DEVWF-T004 in the title

![Shows the menu item for navigating to the Pull Request](../../../Assets/PullRequestDEVWF-T004.png)

3. In the Pull Request, check the conversation, Commits, Checks and Files Changed Tabs, and got through the instructions and changes.

4. On the Conversation Tab, press the Merge Pull Request Button, to merge the files in to the main branch. Link the Pull Request to your Azure Boards Work item for Module 1 by typing AB#Module1WorkItemID in the title or description of the Pull Request Commit Message. 

![Shows the button for merging a Pull Request in GitHub](../../../Assets/mergePullRequest.png)

Now your repository contains 3 new "multi-staged" docker file.

6. In your GitHub Codespace, update your files to the latest version by pulling them.

![](../../../Assets/2020-10-05-12-10-11.png)


7. Open your PowerShell terminal window. From the content-api folder containing the API application files and the new Dockerfile, type the following command to create a Docker image for the API application. This command does the following:

   - Executes the Docker build command to produce the image
   - Tags the resulting image with the name content-api (-t)
   - The final dot (".") indicates to use the Dockerfile in this current directory context. By default, this file is expected to have the name "Dockerfile" (case sensitive).


   ```bash
   docker build -t fabrikam-api .
   ```

8. Do the same for the `content-web` and the `content-init` containers

   ```bash
   cd ../content-init
   docker build -t fabrikam-init .
  
   cd ../content-web
   docker build -t fabrikam-web .
   ```

9. Make sure you remove all running images to avoid conflict with ports in use. When you run `docker ps -a` you see all containers that are running or are stopped. Remove all containers, except the `cloudenvimage` and the `mongo` container. The `cloudenvimage` contains your GitHub Codespace and the `mongo` contains your populated database.

```
docker rm -f <containername or id>
```

10. Run all containers and check if the application still works as expected

```bash
docker run -d --name api -p 3001:3001 --net fabrikam fabrikam-api
docker run -d --name web -p 3000:3000 --net fabrikam fabrikam-web
```

11. When you are done, commit and push your changes to your GitHub repository.
![](../../../Assets/commitandpush.png)