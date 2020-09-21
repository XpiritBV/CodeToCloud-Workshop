# Containerize the Application
One of the biggest complaints the developers had during the round of interviews is that is very hard to run the application locally and to get started. Because there are so many changes for the various customers, the code base changes a lot. To quickly get started with a stable version for a customer, to test some things or to add minor features takes too much time. Furthermore, once the application is deployed, unknown issues occur because production is so different from the development environment.

In the proposed solution architecture Fabrikam wants to move towards the Azure Cloud and start using Azure Kubernetes Service. This allows them to run a cloud-native architecture without a lock-in to a specific cloud because of the use of containers. Therefore the team decides to start using Docker containers for their local development too. You already run the MongoDB in a container, now it is time to move the rest as well. 

## Challenge
In this challenge you will create a container for the API and WEB application. For that you need to create a Dockerfile in the content-api and the content-web folder that builds and runs the API and WEB application. One of the developers is very eager about this and already started work in the evening and shared [this gist for the api](https://gist.github.com/renevanosnabrugge/b2390f11c45671f6d0a9c6c9bb2c01ca) and [this gist for the web app](https://gist.github.com/renevanosnabrugge/251e01fa380c10c8282ffc7f11ff0526) with you that builds and runs the application. Make sure you embed this in the source code and run the API and WEB app in the container.

You also decide it is convenient to have a container for the Initialization of the database contents. There is [a gist created](https://gist.github.com/renevanosnabrugge/5178c88a09e8c6cdd66a2eb0dc6dcba2) for that as well. 

## Validation
* Dockerfile that builds and runs the API is part of the content-api folder. Call the Docker image [fabrikam-api]
* Dockerfile that builds and runs the WEB app is part of the content-web folder. Call the Docker image [fabrikam-web]
* Dockerfile that builds and runs the Init app is part of the content-iniy folder. Call the Docker image [fabrikam-init]
* API accesses the MongoDB in the container

> Tip
> Make sure the 3 containers run on the same network
> You can access another container on the same network by name. For example: If you call your running container `api` you can access this by navigating to `http://api` in another container

## Links
* [Build and Run your image](https://docs.docker.com/get-started/part2/)
* [docker build](https://docs.docker.com/engine/reference/commandline/build/)
* [docker run](https://docs.docker.com/engine/reference/run/)

## Step by Step Explanation
To read or view a step by step explanation of this challenge, please visit [this page](../Step-By-Step/DEVWF-SBS002.md)
