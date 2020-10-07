---
title: Docker files for the content-web, content-api and content-init application
branch: users/maria/application-docker-files
commitmessage: "Created 3 Docker files :whale: for API, WEB and INIT"
committer: Maria Santos
committeremail: MariaSantos@FabrikamMedical.example.org
linktoworkitem: Module1
---
# Instructions to Fix the exercise

Added these 3 Docker files. I was so excited about this Docker stuff, that I created these 3 files for the API, WEB and INIT application. I think it can be improved, but let's first check if this works!

To build this

```bash
cd content-web
docker build -t content-web .

cd ../content-init
docker build -t content-init .

cd ../content-api
docker build -t content-api .
```

> Before you run the api make sure your MongoDB is running

```bash
docker network create fabrikam
docker run --name mongo --net fabrikam -p 27017:27017 -d mongo
```

To run it

```bash
docker run -ti --network fabrikam fabrikam-init
docker run -d --name api -p 3001:3001 --network fabrikam fabrikam-api
docker run -d --name web -p 3000:3000 --network fabrikam fabrikam-web
```
