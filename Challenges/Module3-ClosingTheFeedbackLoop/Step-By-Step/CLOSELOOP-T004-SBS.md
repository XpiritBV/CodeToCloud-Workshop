# Step by Step CLOSELOOP-T004

If you rather watch a video with step by step instructions, you can do that here
[![Step by Step Video](https://img.youtube.com/vi/4CPX2A3DR9I/0.jpg)](https://www.youtube.com/watch?v=4CPX2A3DR9I)


In this challenge you are going to replace the `:latest` tag in the docker-compose file with the build number from the pipeline. You will also add an automated check to the pipeline to validate if images are only coming from your own GitHub repository using an automated policy. 

1. Open your Azure Pipeline in Edit mode. Under the `checkout` task in the DeployProd stage, add the following snippet

```YAML
 - powershell: (gc .\docker-compose.yml) -replace ':latest',':$(Build.BuildNumber)' | set-content .\docker-compose.yml
```
This replaces the `:latest' tag in the docker-compose.yml file with the build number. This way, the deployment of the Azure Web App will be with the latest version of the container

2. In the menu under pipelines, select [Environments] and select production

![](/Assets/2020-10-16-15-30-29.png)

3. Select the 3 dots, to see the options of this environment
![](/Assets/2020-10-16-15-31-56.png)

4. Choose Approvals and Checks. and choose the Evaluate Artifact policy

5. Name the policy [GHCR Validation] and press the [Use Templates] Button

6. Choose [Whitelist Sources] and press next

7. Fill in the name of your GitHub Container Registry  e.g. `ghcr.io/<your github acount>`

8. Press Next and Create. 

9. Run the pipeline to test your changes

> When you do not want to type all commands try the solution Pull Request by running

```
Workshop-Step Solution "CLOSELOOP-T004"
```
