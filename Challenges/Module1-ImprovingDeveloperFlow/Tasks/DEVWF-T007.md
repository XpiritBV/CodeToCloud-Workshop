# Set up Continuous Integration to push container images to GitHub Registry
Developers are working locally with their images to quickly develop the software. However, when they published their containers to start testing, the team notices that there is a lot of differences with their development environments. 

After some research, they find that small bugs occur because the latest version was not used. Main reason is that everybody is building their own container images, and there is not a "golden image" that can be used for testing purposes. You and your team suggest to implement Continuous Integration and to push the latest version of the container image to a Container Registry hosted on GitHub after every change. This container registry can then serve as the repository that contains the latest images to use and deploy on the various environments for testing etc.

## Challenge
In this challenge you are going to shorten the feedback loop and ensure that stable images are centrally available. For that you are going to set up a Continuous Integration Build with GitHub Actions, that builds the Docker image and pushes that to the GitHub Container Registry. 

## Validation
* GitHub Container Registry populated with 3 docker images. [fabrikam-init], [fabrikam-web] and [fabrikam-api]
* GitHub Action workflow created that builds and pushes the [fabrikam-web] (from the content-web) image to the GitHub Container Registry
* GitHub Action workflow created that builds and pushes the [fabrikam-api] (from the content-api) image to the GitHub Container Registry
* GitHub Action workflow created that builds and pushes the [fabrikam-init] (from the content-init) image to the GitHub Container Registry
* Added a GitHub Secret called `CR_PAT` that contains the Personal Access Token to push and pull containers to the GitHub Container registry

> Tips
>
> Create a GitHub Action based on the [Publish Docker Container] startup workflow
>
> Create a PAT token in GitHub and add it as a GitHub secret as CR_PAT to access the GitHub Container registry
>
>![](/Assets/GithubAction-DockerPublish.png)
>
> Remove the `test` job from the generated GitHub Action
>
> Make sure you add a `working-directory` to all the Docker steps in your GitHub Action


## Links & Information
* [Getting started with GitHub Container Registry](https://docs.github.com/en/packages/getting-started-with-github-container-registry)
* [Publishing a package using an action](https://docs.github.com/en/packages/using-github-packages-with-your-projects-ecosystem/using-github-packages-with-github-actions#publishing-a-package-using-an-action)
* [Migrating to GitHub Container Registry for Docker images](https://docs.github.com/en/packages/getting-started-with-github-container-registry/migrating-to-github-container-registry-for-docker-images)
* [Pushing and pulling Docker images](https://docs.github.com/en/packages/managing-container-images-with-github-container-registry/pushing-and-pulling-docker-images)
* [Publish containers to GitHub Container Registry with GitHub Actions](https://medium.com/cooking-with-azure/publish-containers-to-github-container-registry-with-github-actions-4e39700ae14c)