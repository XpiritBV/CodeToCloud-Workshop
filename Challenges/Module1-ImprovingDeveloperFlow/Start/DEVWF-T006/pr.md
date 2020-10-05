---
title: "Docker compose file for running API and MongoDB (DEVWF-T006)"
branch: users/tyrone/docker-compose-api
commitmessage: "Created Docker Compose file for API and MongoDB"
committer: Tyrone Mullett
committeremail: tyronemullet@consultancyfirm.example.org
linkedworkitem: WorkItemIdModule1
---
# Instructions to Fix the exercise
Added 2 docker-compose files to the root of the repo. the `docker-compose.yml` contains the containers that always need to be started. This can be extended by adding another file for the initialization of the database. For our DB `docker-compose.init.yml` has been added.

To build and run these containers
```
docker-compose -f docker-compose.yml -f docker-compose.init.yml build
docker-compose -f docker-compose.yml -f docker-compose.init.yml up
```

To stop
```
docker-compose -f docker-compose.yml -f docker-compose.init.yml down
```