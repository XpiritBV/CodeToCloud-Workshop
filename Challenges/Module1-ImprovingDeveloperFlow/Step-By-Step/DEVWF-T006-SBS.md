## Step by Step DEVWF-T006

In this task you are going to create a new Docker Compose file that contains the MongoDB, the API and the Web Application.

>This task has a Starter solution, that creates a Pull Request containing some files and instructions. 
>
> In order to run the automated Starter Solution, you need to go through the [Setup prerequisites](/Challenges/Prequisites/RunThroughSetup.md) first!

1. In your GitHub Codespace, open a PowerShell Terminal and run the starter solution. A Pull Request with 2 Docker compose files will be created

```
.workshop/workshop-step.ps1  Start "DEVWF-T006"
```

2. In your GitHub repository, navigate to the Tab Pull Requests and open the Pull Request with DEVWF-T006 in the title

3. In the Pull Request, check the conversation, Commits, Checks and Files Changed Tabs, and got through the instructions and changes.

4. On the Conversation Tab, press the Merge Pull Request Button, to merge the files in to the main branch. Link the Pull Request to your Azure Boards Work item for Module 1 by typing AB#Module1WorkItemID in the title or description of the Pull Request Commit Message. 

![Shows the button for merging a Pull Request in GitHub](/Assets/mergePullRequest.png)

Now your repository contains 2 new "Docker Compose" files.

6. In your GitHub Codespace, update your files to the latest version by pulling them.

![](/Assets/2020-10-05-12-10-11.png)

7. Open your PowerShell terminal window. From the root folder, start the application.
```
docker-compose -f docker-compose.yml -f docker-compose.init.yml build
docker-compose -f docker-compose.yml -f docker-compose.init.yml up
```

8. To include the web application to the docker-compose file, add the following YAML snippet to the docker-compose.yml

```YAML
  web:
    build: ./content-web
    image: content-web
    depends_on:
      - api
    environment:
      CONTENT_API_URL: http://api:3001
    ports:
      - "3000:3000" 
```

9. Build and run the docker-compose file again 

```
docker-compose -f docker-compose.yml -f docker-compose.init.yml build
docker-compose -f docker-compose.yml -f docker-compose.init.yml up
```

10. Test the web application using the port forward method. In the Remote Explorer, forward port 3000 and open the browser by clicking the globe icon next to the port. 
![](/Assets/OpenBrowser.png)

11. When you are done, commit and push your changes to your GitHub repository.
![](/Assets/commitandpush.png)


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
![](/Assets/commitandpush.png)