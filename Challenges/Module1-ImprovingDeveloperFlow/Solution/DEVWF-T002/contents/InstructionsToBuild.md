# Instructions to Build

In order to build and run the application follow these instructions.

On the command line in the root of the repo create a new network and start a docker container

```bash
docker network create fabrikam
docker run -ti --name mongo --network fabrikam -p 27017:27017 mongo
```

Install all NPM packages to run the application. First the content-init to populate the database with data.

> Important to remember that the name of the container `mongo` is important

```bash
cd content-init
npm install
node ./server.js
```

After that the API

```bash
cd content-api
npm install
node ./server.js
```

And the web application

```bash
cd content-web
npm install
ng build
node ./app.js
```
