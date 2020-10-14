---
title: "Docker compose file for running API and MongoDB (DEVWF-T006)"
branch: users/tyrone/docker-compose-api
commitmessage: "Created Docker Compose file for API and MongoDB"
committer: Tyrone Mullett
committeremail: tyronemullet@consultancyfirm.example.org
linkedworkitem: Module1
---
# Instructions to Fix the exercise

Added 3 docker-compose files to the root of the repo. the `docker-compose.yml` contains the containers that always need to be started. This can be extended by adding another file for the initialization of the database. For our DB `docker-compose.init.yml` has been added. To run the application locally, you can add the file `local.docker-compose.yml` that overrides some settings and starts the application.

To build and run these containers

```bash
docker-compose -f docker-compose.yml -f local.docker-compose.yml -f docker-compose.init.yml build
docker-compose -f docker-compose.yml -f local.docker-compose.yml -f docker-compose.init.yml up

```

To stop
```bash
docker-compose -f docker-compose.yml -f local.docker-compose.yml -f docker-compose.init.yml down
```
