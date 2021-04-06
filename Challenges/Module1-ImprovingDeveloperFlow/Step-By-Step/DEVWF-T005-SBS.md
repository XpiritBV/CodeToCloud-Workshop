# Step by Step DEVWF-T005

If you rather watch a video with step by step instructions, you can do that here
[![Step by Step Video](https://img.youtube.com/vi/rjdF-JjZm6Q/0.jpg)](https://www.youtube.com/watch?v=rjdF-JjZm6Q)

In this task, you will enable the GitHub security features for your repository.

1. In your GitHub repository, navigate to the [Security] Tab. Press the [Enable Dependabot alerts] button and the [Set up Code Scanning] button

    ![Enable Dependabot and Code Scanning Alerts](/Assets/securityfeatures.png)

1. In the Dependabot features, enable Dependabot Alerts and Dependabot security updates

1. In the Code Scanning features, select the CodeQL Analysis workflow. This workflow is a GitHub Action that runs every time you check in some code to the main branch

    ![Setup this Workflow in CodeQL](/Assets/CodeQLAction.png)

1. Save the workflow by pressing the [Start Commit] button

1. To solve a Dependabot issue, navigate to the Security Tab and press View Dependabot Alerts. when there is nothing to see, the Dependabot engine is still running. Wait a few minutes and refresh the screen

    ![](/Assets/2020-10-05-12-51-55.png)

1. Find the [handlebars] vulnerability and open this by clicking on the title.

    ![](/Assets/handlebars.png)

1. Press the Create Dependabot Security update button. This may take a couple of seconds.

    ![](/Assets/2020-10-05-13-03-26.png)

1. In the Pull Requests, find the the Dependabot Security patch, and merge the Pull Request to your main branch

1. To solve a Code Scanning issue, navigate to the Security Tab and press View Alerts next to Code Scanning alerts.

1. Select an issue. In the details select "Won't Fix"

    ![](/Assets/2020-10-05-13-10-25.png)

1. When you are done, pull the changes from your GitHub repository.

    ![](/Assets/2020-10-05-12-10-11.png)