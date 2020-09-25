---
title: Fix for Exercise DEVWF-002
branch: c2c-devwf-002
commitmessage: "Added instructions to build and run the application "
committer: Josh Almond
committeremail: JoshAlmond@FabrikamMedical.example.org
---
# Instructions to Fix the exercise

In order to build and run the application this worked for me.

On the command line in the root of the repo I created a new network and started a docker container

```
docker network create fabrikam
docker run -ti --name mongo --network fabrikam -p 27017:27017 mongo
```

Then I installed all NPM packages to run the application. First the content-init to populate the database with data. 
> Important to remember that the name of the container `mongo` is important

```
cd content-init
npm install
node .\server.js
```

After that the API

```
cd content-api
npm install
node .\server.js
```

And the web application

```
cd content-web
npm install
ng build
node .\app.js
```
 
 