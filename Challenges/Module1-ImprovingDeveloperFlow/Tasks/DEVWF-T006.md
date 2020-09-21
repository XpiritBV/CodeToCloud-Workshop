# Setting up a local infrastructure
The complete application is running in containers. Developers gained a lot of speeds with development, but they also notice that change often occur in both WEB and API. When this happens, they need to build both containers and run them again, which delays them. Now that you see that Docker containers are embraced you find the time right to introduce the possibility to run a complete application that consist of multiple components at once. You introduce `docker-compose` to the team. This allow the team to define a composition of containers, that can be build, started, and topped all at once.

## Challenge 
In this challenge you are going to create a new Docker Compose file that contains the MongoDB, the API and the Web Application. The  branch called [DEVWF-T006] there is already a docker compose file that was created by one of your peers. Only the web application needs to be added here

# Validation 
* Docker compose file is merged to the master branch
* Docker compose file builds and runs the MongoDB, the API and the Web Application
* Application can be started via `docker-compose run`

