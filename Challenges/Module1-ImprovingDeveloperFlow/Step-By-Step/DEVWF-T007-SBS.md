# Step by Step DEVWF-T007

If you rather watch a video with step by step instructions, you can do that here
[![Step by Step Video](https://img.youtube.com/vi/2FgK5SNVFCA/0.jpg)](https://www.youtube.com/watch?v=2FgK5SNVFCA)

*Note*: the Publish Docker Container template has been updated in Github, the video is based on an older template. The description below is more accurate when creating a new template.

In this task, you will use YAML to define 3 GitHub Actions workflows that builds your Docker images and pushes it to a GitHub Container Registry automatically.

1. In your GitHub repository, and select the [Settings] tab.

1. From the left menu, select [Secrets].

1. Select the [New secret] button (or [New repository secret] button).

    ![Settings link, Secrets link, and New secret button are highlighted.](/Assets/2020-08-24-21-45-42.png "GitHub Repository secrets")

1. In the [New secret] form, enter the name `CR_PAT` and for the value, paste in a GitHub Personal Access Token, with the following scopes.

    * repo
    * write:packages
    * read:packages

    > You can use the same GitHub PAT that you created in the prerequisite setup and that is now stored in your local settings.json file in the .workshop directory in your GitHub CodeSpace
    >
    > To generate a new GitHub Personal Access Token, please follow the steps described [on this webpage](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token).

    ![A screen that show how to add a new secret](/Assets/newsecret.png)

1. Navigate to the GitHub Actions in your repository and select [New Workflow]

    ![A screen that shows how to start a new Workflow for GitHub Actions](/Assets/newworkflow.png)

1. Under the Continuous Integration Workflows, find the [Publish Docker Container] workflow and choose [Set up this workflow]

    ![A screenshot of the GitHub Action for Publishing Docker Files](/Assets/PublishDocker.png)

1. Rename the file to `fabrikam-web.yml`
1. Change the image name to fabrikam-web. This is the name of the container image that will be pushed to the GitHub Container Registry

    ```YAML
    env:
      # Use Github Container Registry (ghcr)
      REGISTRY: ghcr.io
      # TODO: Change variable to your image's name.
      IMAGE_NAME: fabrikam-web
    ```

1. The Publish Docker Container template consists of three jobs:
* https://github.com/docker/login-action
* https://github.com/docker/metadata-action
* https://github.com/docker/build-push-action
Ensure to provide the right values for the registry, username and password (`${{ env.REGISTRY }}`, `${{ github.actor }}` and `${{ secrets.CR_PAT }}`)

1. In the metadata step, make sure to set some tags and labels.

1. The workflow for fabrikam-web should look as follows:

    ```yaml
        name: Fabrikam Web Build

        # This workflow uses actions that are not certified by GitHub.
        # They are provided by a third-party and are governed by
        # separate terms of service, privacy policy, and support
        # documentation.

        on:
        push:
          # Publish `main` as Docker `latest` image.
          branches: [ main ]
          paths:
          - 'content-web/**'
          - '.github/workflows/fabrikam-web.yml'
          # Publish `v1.2.3` tags as releases.
          tags: [ 'v*.*.*' ]
        pull_request:
          branches: [ main ]

        env:
          # Use docker.io for Docker Hub if empty
          REGISTRY: ghcr.io
          # github.repository as <account>/<repo>
          IMAGE_NAME: fabrikam-web

        jobs:
        build:
          runs-on: ubuntu-latest
          if: github.event_name == 'push'
          permissions:
            contents: read
            packages: write

          steps:
          - name: Checkout repository
              uses: actions/checkout@v2

          # Login against a Docker registry except on PR
          # https://github.com/docker/login-action
          - name: Log into registry ${{ env.REGISTRY }}
              if: github.event_name != 'pull_request'
              uses: docker/login-action@28218f9b04b4f3f62068d7b6ce6ca5b26e35336c
              with:
                registry: ${{ env.REGISTRY }}
                username: ${{ github.actor }}
                password: ${{ secrets.CR_PAT }}

          # Extract metadata (tags, labels) for Docker
          # https://github.com/docker/metadata-action
          - name: Extract Docker metadata
              id: meta
              uses: docker/metadata-action@98669ae865ea3cffbcbaa878cf57c20bbf1c6c38
              with:
                images: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
                tags: |
                  type=semver,pattern={{version}}
                  # output 0.1.2
                labels: |
                  org.opencontainers.image.title=Fabrikam Web Build
                  org.opencontainers.image.description=CodeToCloud Fabrikam Container
                  org.opencontainers.image.vendor=MyCompany

          # Build and push Docker image with Buildx (don't push on PR)
          # https://github.com/docker/build-push-action
          - name: Build and push Docker image
              uses: docker/build-push-action@ad44023a93711e3deb337508980b4b5e9bcdc5dc
              with:
                context: .
                push: ${{ github.event_name != 'pull_request' }}
                tags: ${{ steps.meta.outputs.tags }}
                labels: ${{ steps.meta.outputs.labels }}
    ```

1. Commit the file to the repository
1. The GitHub Action is now running and automatically builds and pushes the container

    ![Screen that shows that the GitHub action build succeeded](/Assets/buildsucceed.png)

1. Next, setup the `content-api` workflow and the `content-init` workflow. Call the files `fabrikam-api.yml` and `fabrikam-init.yml` and change the container names also into `fabrikam-api` and `fabrikam-init`.
*These workflows are very similar to the one shown above, but `fabrikam-web` should be replaced by `fabrikam-api` et cetera.*

1. Navigate to the packages in your GitHub account and see if the container images are present.
    ![Overview of all packages of a GitHub account](/Assets/packages.png)

1. When you are done, pull the changes from your GitHub repository.

    ![](/Assets/2020-10-05-12-10-11.png)
