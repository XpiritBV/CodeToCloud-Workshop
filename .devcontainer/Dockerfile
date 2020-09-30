FROM mcr.microsoft.com/vscode/devcontainers/universal:linux

USER root

# [Option] Install Docker CLI
ARG INSTALL_DOCKER="false"
COPY library-scripts/docker-debian.sh /tmp/library-scripts/
RUN if [ "${INSTALL_DOCKER}" = "true" ]; then \
        bash /tmp/library-scripts/docker-debian.sh "true" "/var/run/docker-host.sock" "/var/run/docker.sock" "codespace"; \
    else \
        echo '#!/bin/bash\nexec "$@"' > /usr/local/share/docker-init.sh && chmod +x /usr/local/share/docker-init.sh; \
    fi \
    && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 \
    && sudo apt-add-repository -u https://cli.github.com/packages \
    && apt-get update \
    && apt-get -y install --no-install-recommends gh 

RUN SOURCE_SOCKET=${2:-"/var/run/docker-host.sock"} \
    && TARGET_SOCKET=${3:-"/var/run/docker.sock"} \
    && sudo touch "${SOURCE_SOCKET}" \
    && sudo ln -s "${SOURCE_SOCKET}" "${TARGET_SOCKET}"

USER codespace

RUN npm install -g @angular/cli 
    
RUN az extension add --name azure-devops \
    && az extension add --name application-insights \
    && az extension add --name portal