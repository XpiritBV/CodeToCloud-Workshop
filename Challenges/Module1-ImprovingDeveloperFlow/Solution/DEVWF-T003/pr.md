---
title: Fix for Exercise DEVWF-003
branch: c2c-devwf-003
commitmessage: "Created 2 Dockerfiles for API and WEB"
committer: Katrina Spade
committeremail: KatrinaSpade@FabrikamMedical.example.org
---
# Instructions to Fix the exercise
I added these 2 Docker files. I was so excited about this Docker stuff, that I created these 2 files for both the API and the WEB application. I think it can be improved, but let's first check if this works!
 
To build this
```
docker build -t content-web .
docker build -t content-api .
```

To run it 
```
docker run -ti --network fabrikam content-api
docker run -ti --network fabrikam content-web
```


