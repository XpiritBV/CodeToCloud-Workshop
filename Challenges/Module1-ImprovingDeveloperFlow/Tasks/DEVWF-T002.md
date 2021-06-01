# DEVWF-T002 Running the application locally

Fabrikam already ran their conference websites in their on-premises data center. To get a quick glance of how such an application looks like, you and your team start by running one of the customer implementations. This will also serve as the pilot project to move towards the cloud. 

The conference website uses a MongoDB database. For development purposes Fabrikam runs a few MongoDB instances on their local network as well. However, now that there is so much demand from different customers, there are not enough MongoDB instances available and developers are sharing databases for different customers. This results in all kinds of strange behavior because the data structures differ. You and your team decide to solve this issue first.

## Challenge

In this challenge you are going to Dockerize the MongoDB and fill this with initial data. This container can then serve as the clean starter database for the conference website. In your [CodeToCloud-Source] repository, you will use the content-init files to fill a new MongoDB that runs in a Docker container and writes the contents of the database to this container. After that you can start new Mongo containers with the same volume mapping to use as a starting point for your conference API and website that you can then run locally.

## Validation

- A new Docker Network called [fabrikam] has been created
- A Mongo instance runs in a Docker called [mongo] on the [fabrikam] network on port 27017
- The DB has been filled with data from the content-init folder
- The website and API are both started locally

> ### Tips and Hints
>
> Run a Mongo container (from the root) with the command `docker run -ti --name mongo --network fabrikam -p 27017:27017 mongo`
>
> Build and start the content-init by using `npm install` and `node .\server.js`
>
> Build and start the content-api by using `npm install` and `node .\server.js`
>
> Build the web application using `npm install` and `ng build` (Angular)
>
> Build and start the content-web by using `npm install` and `node .\app.js`
>
> Make sure your that Port forwarding is working in your Codespace for port 3000 and 3001

## Links & Information

* [Create a Docker Network](https://docs.docker.com/engine/reference/commandline/network_create/)
* [Connect to MongoDB from another Docker container](https://hub.docker.com/_/mongo)
* [Install NodeJS](https://nodejs.org/en/download/)
* [Install Angular CLI](https://cli.angular.io/)
* [Port Forwarding in Codespaces](https://code.visualstudio.com/docs/remote/containers#_forwarding-or-publishing-a-port)

## Solution

If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command from the PowerShell Terminal from a PowerShell terminal, a Pull Request with the files and instructions will be created for you.

```powershell
Workshop-Step Solution "DEVWF-T002"
```

To read or view a step by step explanation of this challenge, please visit [this page](/Challenges/Module1-ImprovingDeveloperFlow/Step-By-Step/DEVWF-T002-SBS.md)

### Next Step

When you are done, move to the [next challenge](DEVWF-T003.md)
