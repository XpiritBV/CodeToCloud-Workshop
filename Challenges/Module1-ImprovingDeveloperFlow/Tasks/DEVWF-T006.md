# DEVWF-T006 Setting up a local infrastructure

The entire application is now running in containers. Developers gained a lot of speed with development, but they also notice that changes often occur in both WEB and API. When this happens, they need to build both containers and run them again, which delays them. 

You and your team of consultants see that Docker containers are truly embraced. You find the time right to introduce the possibility to run a entire application that consists of multiple components at once. For that, you introduce `docker-compose` to the DevOps team. This allows the team to define a composition of containers, that can be built, started, and stopped all at once.

## Before you start this challenge

This challenge needs some prerequisites. Run the following command in your PowerShell Terminal window of your GitHub Codespace to set this up.
```
Workshop-Step Start "DEVWF-T006"
```

## Challenge 

In this challenge you are going to create a new Docker Compose file that contains the MongoDB, the API and the Web Application. 

The Pull Request called `Docker compose file for running API and MongoDB (DEVWF-T006)` contains 2 docker compose files that were created by one of your peers. Only the web application needs to be added here. 

## Validation 

* Docker compose files are merged to the main branch
* Docker compose file builds and runs the MongoDB, the API and the Web Application
* Application can be started via `docker-compose up`

> ### Tips:
> - Run the command `docker rm -f` to remove running containers that have a port already in use (you may have to stop and remove the web and api containers).
> - Set the environment variable CONTENT_API_URL for the web container to `http://api:3001`.

## Links & Information

* [Overview of Docker Compose](https://docs.docker.com/compose/)
* [Extending files with Docker Compose](https://docs.docker.com/compose/extends/)

## Solution

If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command from the PowerShell Terminal, a Pull Request with the files and instructions will be created for you. 

```powershell
Workshop-Step Solution "DEVWF-T006"
```

To read or view a step by step explanation of this challenge, please visit [this page](/Challenges/Module1-ImprovingDeveloperFlow/Step-By-Step/DEVWF-T006-SBS.md)

### Next Step
When you are done, move to the [next challenge](DEVWF-T007.md)