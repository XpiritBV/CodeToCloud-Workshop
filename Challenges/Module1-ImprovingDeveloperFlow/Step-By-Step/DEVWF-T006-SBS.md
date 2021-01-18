# Step by Step DEVWF-T006

If you rather watch a video with step by step instructions, you can do that here
[![Step by Step Video](https://img.youtube.com/vi/ADth4SspHxE/0.jpg)](https://www.youtube.com/watch?v=ADth4SspHxE)

In this task you are going to create a new Docker Compose file that contains the MongoDB, the API and the Web Application.

>This task has a Starter solution, that creates a Pull Request containing some files and instructions. 
>
> In order to run the automated Starter Solution, you need to go through the [Setup prerequisites](/Challenges/Prerequisites/Readme.md) first!

1. In your GitHub Codespace, open a PowerShell Terminal and run the starter solution. A Pull Request with 2 Docker compose files will be created

    ```bash
    Workshop-Step Start "DEVWF-T006"
    ```

2. In your GitHub repository, navigate to the Tab Pull Requests and open the Pull Request with DEVWF-T006 in the title

3. In the Pull Request, check the conversation, Commits, Checks and Files Changed Tabs, and got through the instructions and changes.

4. On the Conversation Tab, press the Merge Pull Request Button, to merge the files in to the main branch. Link the Pull Request to your Azure Boards Work item for Module 1 by typing `AB#` followed by the workitem id for Module 1 (example: `AB#123`) in the title or description of the Pull Request Commit Message. 

    ![Shows the button for merging a Pull Request in GitHub](/Assets/mergePullRequest.png)

Now your repository contains 3 new "Docker Compose" files.

6. In your GitHub Codespace, update your files to the latest version by pulling them.

    ![](/Assets/2020-10-05-12-10-11.png)

7. Change the <yourgithubaccount> in the docker-compose files to your GitHub Account. Open your PowerShell terminal window. From the root folder, start the application.

    ```bash
    docker-compose -f docker-compose.yml -f local.docker-compose.yml -f docker-compose.init.yml build
    docker-compose -f docker-compose.yml -f local.docker-compose.yml -f docker-compose.init.yml up
    ```

8. To include the web application to the docker-compose file, add the following YAML snippet to the `docker-compose.yml`

    ```YAML
    web:
        image: ghcr.io/renevanosnabrugge/fabrikam-web:latest
        depends_on:
            - api
        environment:
            CONTENT_API_URL: http://api:3001
        ports:
            - "3000:80"       
    ```

   and the following YAML snippet to the `local.docker-compose.yml`. That overrides the name of the image

    ```YAML
    web:
        build: ./content-web
        image: local-fabrikam-web
    ```

9. Build and run the docker-compose file again 

    ```bash
    docker-compose -f docker-compose.yml -f local.docker-compose.yml -f docker-compose.init.yml build
    docker-compose -f docker-compose.yml -f local.docker-compose.yml -f docker-compose.init.yml up
    ```

10. Test the web application using the port forward method. In the Remote Explorer, forward port 3000 and open the browser by clicking the globe icon next to the port. 

    ![](/Assets/OpenBrowser.png)

11. When you are done, commit and push your changes to your GitHub repository.

    ![](/Assets/commitandpush.png)


