# Getting insights in to your application

After running for a few days, the pilot customer reaches out and complains about an unstable website. Sometimes it works, sometimes it does not. Sometimes it is fast, sometimes it is not. After this telephone call, the DevOps team is extra alert on issues with this application. And indeed, now that they monitor the application more closely (manually), they see that the web application is not always showing up, or is very slow from time to time. However, the reason is unclear and needs to be investigated.

## Challenge

In this challenge you will set up Application Insights to monitor your application and underlying infrastructure. You need to create an Application Insights Azure resource by adding this to your Infrastructure as Code scripts and connect this to your cluster. Furthermore, you need to add Application Insights in your Web Application to gain insights in usage.

## Validation

* Application Insights SDK added to the content-web application
* Application Insights resource created in the Azure resource group

> Tips
>
> * The Azure CLI for application insights resides in an extension az extension add application-insights
> * Create an application Insights Azure resource using the az monitor app-insights component create command
> * Add the SDK by running `npm install applicationinsights --save` in the content-web folder
> * Add the following lines of code below `express` in the app.js
>
>     ```javascript
>     const appInsights = require("applicationinsights");
>     appInsights.setup("[YOUR APPINSIGHTS KEY]");
>     appInsights.start();
>     ```
>


## Links & Information

* [What is Application Insights](https://docs.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview#:~:text=Application%20Insights%2C%20a%20feature%20of,to%20monitor%20your%20live%20applications.&text=It%20can%20monitor%20and%20analyze,with%20Visual%20Studio%20App%20Center.)
* [Azure CLI for Application Insights](https://docs.microsoft.com/en-us/cli/azure/ext/application-insights/monitor/app-insights?view=azure-cli-latest)


## Solution

If you are stuck or you want to progress to the next challenge, there is a solution prepared for you. When you run the following command from the PowerShell Terminal, a Pull Request with the files and instructions will be created for you. 

```powershell
Workshop-Step Solution "CLOSELOOP-T001"
```

To read or view a step by step explanation of this challenge, please visit [this page](/Challenges/Module3-ClosingTheFeedbackLoop/Step-By-Step/CLOSELOOP-T001-SBS.md)

### Next Step

When you are done, move to the [next challenge](CLOSELOOP-T002.md)
