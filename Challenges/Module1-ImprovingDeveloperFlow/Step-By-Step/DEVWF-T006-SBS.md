# Step by Step DEVWF-T006

If you rather watch a video with step by step instructions, you can do that here
[![Step by Step Video](https://img.youtube.com/vi/ADth4SspHxE/0.jpg)](https://www.youtube.com/watch?v=ADth4SspHxE)

In this task you are going to create a new Docker Compose file that contains the MongoDB, the API and the Web Application.

>This task has a Starter solution, that creates a Pull Request containing some files and instructions. 
>
> In order to run the automated Starter Solution, you need to go through the [Setup prerequisites](/Challenges/Prerequisites/Readme.md) first!

1. In your GitHub Codespace, run the starter solution in a PowerShell Terminal. A Pull Request with 2 Docker compose files will be created

    ```powershell
    Workshop-Step Start "DEVWF-T006"
    ```

1. In your GitHub repository, navigate to the Tab Pull Requests and open the Pull Request with DEVWF-T006 in the title

1. In the Pull Request, check the conversation, Commits, Checks and Files Changed Tabs, and go through the instructions and changes.

1. On the Conversation Tab, press the Merge Pull Request Button, to merge the files in to the main branch. Link the Pull Request to your Azure Boards Work item for Module 1 by typing `AB#` followed by the work item id for Module 1 (example: `AB#123`) in the title or description of the Pull Request Commit Message. 

    ![Shows the button for merging a Pull Request in GitHub](/Assets/mergePullRequest.png)

Now your repository contains 3 new "Docker Compose" files.

1. In your GitHub Codespace, update your files to the latest version by pulling them.

    ![](/Assets/2020-10-05-12-10-11.png)

1. Change the `<yourgithubaccount>` in the docker-compose files to your GitHub Account.

1. Make sure you remove all running images to avoid conflict with ports in use. When you run `docker ps -a` you see all containers that are running or are stopped. Remove all containers, except the `mongo` container (and except the `cloudenvimage` container - in case this is shown - which contains your GitHub Codespace). The `mongo` container contains your populated database.

      ```
      docker rm -f <containername or id>
      ```
1. From the root folder, start the application.

    ```bash
    docker-compose -f docker-compose.yml -f local.docker-compose.yml -f docker-compose.init.yml build
    docker-compose -f docker-compose.yml -f local.docker-compose.yml -f docker-compose.init.yml up
    ```

1. To include the web application to the docker-compose file, add the following YAML snippet to the `docker-compose.yml`

    ```YAML
    web:
        image: ghcr.io/<yourgithubaccount>/fabrikam-web:latest
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

1. Build and run the docker-compose file again 

    ```bash
    docker-compose -f docker-compose.yml -f local.docker-compose.yml -f docker-compose.init.yml build
    docker-compose -f docker-compose.yml -f local.docker-compose.yml -f docker-compose.init.yml up
    ```

1. Test the web application by opening the browser by clicking the globe icon next to the port. 

    ![](/Assets/OpenBrowser.png)

1. When you are done, commit and push your changes to your GitHub repository.

    ![](/Assets/commitandpush.png)
