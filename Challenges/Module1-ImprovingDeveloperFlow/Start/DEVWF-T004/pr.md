---
title: "Example for Multi-Staged Docker Files (DEVWF-T004)"
branch: users/catherine/multi-staged-dockerfiles
commitmessage: ":whale: Improved Docker files to be Multi-Staged"
committer: Catherine Rogers
committeremail: catherine@consultancyfirm.example.org
linkedworkitem: Module1
---
# Instructions to Fix the exercise

Cool! After I dove in a little bit more, I learned that the docker containers can be smaller and leaner. Multi-Staged files FTW. I created the Dockerfiles for all applications. Please make sure you really check if is OK before approving.

When you approved the PR, you can run the Docker build and run commands again to get it going

To build this

```bash
docker build -t content-web .
docker build -t content-init .
docker build -t content-api .
```

To run it

```bash
docker run -ti --network fabrikam fabrikam-init
docker run -d --name api -p 3001:3001 --network fabrikam fabrikam-api
docker run -d --name web -p 3000:3000 --network fabrikam fabrikam-web
```
