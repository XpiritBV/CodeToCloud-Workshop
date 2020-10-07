# Step by Step DEVWF-T005

In this task, you will enable the GitHub security features for your repository.

1. In your GitHub repository, navigate to the [Security] Tab. Press the [Enable Dependabot alerts] button and the [Set up Code Scanning] button

![](../../../Assets/securityfeatures.png)

2. In the Dependabot features, enable Dependabot Alerts and Dependabot security updates

3. In the Code Scanning features, select the CodeQL Analysis workflow. This workflow is a GitHub Action that runs every time you check in some code to the main branch

![](../../../Assets/CodeQLAction.png)

4. Save the workflow by pressing the [Start Commit] button

5. To solve a Dependabot issue, navigate to the Security Tab and press View Dependabot Alerts. when there is nothing to see, the Dependabot engine is still running. Wait a few minutes and refresh the screen

![](../../../Assets/2020-10-05-12-51-55.png)

6. Find the [handlebars] vulnerability and open this by clicking on the title.

![](../../../Assets/handlebars.png)

7. Press the Create Dependabot Security update button. 

![](../../../Assets/2020-10-05-13-03-26.png)

8. In the Pull Requests, find the the Dependabot Security patch, and merge the Pull Request to your main branch

9. To solve a Code Scanning issue, navigate to the Security Tab and press View Alerts next to Code Scanning alerts. 

10. Select an issue. In the details select "Won't Fix"
![](../../../Assets/2020-10-05-13-10-25.png)

11. When you are done, commit and push your changes to your GitHub repository.
![](../../../Assets/commitandpush.png)