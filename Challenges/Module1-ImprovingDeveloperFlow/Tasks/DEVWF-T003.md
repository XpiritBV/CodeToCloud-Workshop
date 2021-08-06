# DEVWF-T003 Containerize the Application

One of the biggest complaints the developers had during the round of interviews is that it is very hard to run the application locally and to get started. Because there are so many changes for the various customers, the code base changes frequently. To quickly get started with a stable version for a customer, to test some things or to add minor features takes too much time. Furthermore, once the application is deployed, unknown issues occur because production is so different from the development environment.

Fabrikam wants to move towards the Azure Cloud in the proposed solution architecture. Because of the already existing on-premises application, they want to move to the cloud with as few changes as possible to the on-premises application. You and your team advice to start using Docker. 

Docker allows them to package the existing application, including all (older) frameworks in a container and run this as a web application. Using containers also allows Fabrikam to run a cloud-native architecture without a lock-in to a specific cloud because containers are cloud-agnostic. Therefore the team decides to start using Docker containers for their local development too. Since they already ran the MongoDB in a container, now it is time to move the rest to the cloud as well.

## Challenge

In this challenge you will create a container for the API and WEB application. For that you need to create a Dockerfile in the content-api and the content-web folder that builds and runs the API and WEB application. One of the developers is very eager about this and already started work in the evening and shared [this gist for the api](https://gist.github.com/renevanosnabrugge/b2390f11c45671f6d0a9c6c9bb2c01ca) and [this gist for the web app](https://gist.github.com/renevanosnabrugge/251e01fa380c10c8282ffc7f11ff0526) with you that builds and runs the application. Make sure you embed this in the source code and run the API and WEB app in the container.

You also decide it is convenient to have a container for the Initialization of the database contents. There is [a gist created](https://gist.github.com/renevanosnabrugge/5178c88a09e8c6cdd66a2eb0dc6dcba2) for that as well. 

## Validation

* Dockerfile that builds and runs the API is part of the content-api folder. Call the Docker image [fabrikam-api]
* Dockerfile that builds and runs the WEB app is part of the content-web folder. Call the Docker image [fabrikam-web]
* Dockerfile that builds and runs the INIT app is part of the content-init folder. Call the Docker image [fabrikam-init]
* API accesses the MongoDB in the container

> ##Tip
>
> Use the `docker build` command to build a container in your Codespace
>
> Use the `docker images` command to check if the images are built
>
> Use the `docker run` command to run a container in your Codespace. Use the `--name ` and `--network` switches to name them. Name the web application container `web` and the api container `api`. Use the `-p` switch to port forward the port 80 and 3001 to your local system 
>
> Make sure the 3 containers run on the same network
>
> You can access another container on the same network by name. For example: If you call your running container `api` you can access this by navigating to `http://api` in another container

## Links & Information

* [Build and Run your image](https://docs.docker.com/get-started/part2/)
* [docker build](https://docs.docker.com/engine/reference/commandline/build/)
* [docker run](https://docs.docker.com/engine/reference/run/)

## Solution

If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command from the PowerShell Terminal from a PowerShell terminal, a Pull Request with the files and instructions will be created for you.

```powershell
Workshop-Step Solution "DEVWF-T003"
```

To read or view a step by step explanation of this challenge, please visit [this page](/Challenges/Module1-ImprovingDeveloperFlow/Step-By-Step/DEVWF-T003-SBS.md)

### Next Step

When you are done, move to the [next challenge](DEVWF-T004.md)
