# Step by Step CLOSELOOP-T001

If you rather watch a video with step by step instructions, you can do that here
[![Step by Step Video](https://img.youtube.com/vi/x7pidn6Uk6I/0.jpg)](https://www.youtube.com/watch?v=x7pidn6Uk6I)

In this task you will set up Application Insights to monitor your application and underlying infrastructure. You need to create an Application Insights Azure resource by adding this to your Infrastructure as Code scripts and connect this to your cluster. Furthermore, you need to add Application Insights in your Web Application to gain insights in usage.

We can create all these resources manually, but since we want to do this "the DevOps way", we are going to create all resources as Infrastructure as Code. In this Step by Step we chose to create all resources with the Azure CLI.

## Create Application Insights Azure Resource

To enable Application Insights we need an Application Insights Resource in our resource group

1. In your Codespace, create a new Powershell file (e.g. `setup-appinsights.ps1`) in the same directory as `deploy-infrastructure.ps1`.

2. Add this code snippet to the file

      ```PowerShell
      $studentsuffix = "your abbreviated name"
      $resourcegroupName = "fabmedical-rg-" + $studentsuffix
      $location1 = "westeurope"
      $appInsights = "fabmedicalai-" + $studentsuffix

      az extension add --name application-insights
      $ai = az monitor app-insights component create --app $appInsights --location $location1 --kind web -g $resourcegroupName --application-type web --retention-time 120 | ConvertFrom-Json

      Write-Host "AI Instrumentation Key=$($ai.instrumentationKey)"
      ```

3. Run the PowerShell script. Write down the AI Instrumentation Key. An Application Insights Resource will be created in your Azure Resource Group

## Add Application Insights SDK to your web application

1. First we need to install support for Application Insights in the web application. In your Codespace terminal navigate to the content-web directory and install the application insights SDK.

   ```bash
   npm install applicationinsights --save
   ```

2. To let the application know where to send the instrumentation data, open the `app.js` file in the content-web folder and add the following lines immediately after `express` is instantiated, substitute `AI Instrumentation Key` with the Instrumentation Key from the output of the `setup-appinsights.ps1` script. The Instrumentation Key can be obtained [from the Azure portal as follows](https://docs.microsoft.com/en-us/azure/bot-service/bot-service-resources-app-insights-keys?view=azure-bot-service-4.0#instrumentation-key).

   ```javascript
   const appInsights = require("applicationinsights");
   appInsights.setup("AI Instrumentation Key");
   appInsights.start();
   ```

   ![A screenshot of the code editor showing updates in context of the app.js file](/Assets/hol-2019-10-02_12-33-29.png)

3. Save changes and push these changes to your repository so that GitHub Actions CI will build a new image.

   ```bash
   git add .
   git commit -m "Added Application Insights"
   git push

## Deploy new version of the container to the cluster

1. When the GitHub Action CI completed, (re)deploy the web container to the web application.

To update the website from a command line run the following command

```
az webapp config container set `
--docker-registry-server-password <yourgithub personal access token> `
--docker-registry-server-url https://ghcr.io `
--docker-registry-server-user notapplicable `
--multicontainer-config-file docker-compose.yml `
--multicontainer-config-type COMPOSE `
--name $webappName `
--resource-group $resourcegroupName 
```

2. Visit the website and check Application Insights in the [Azure Portal](http://portal.azure.com/) to see instrumentation data.

> When you do not want to type all commands try the solution Pull Request by running

```
Workshop-Step Solution "CLOSELOOP-T001"
```
