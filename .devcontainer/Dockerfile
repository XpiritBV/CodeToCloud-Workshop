FROM mcr.microsoft.com/vscode/devcontainers/universal:linux

USER root

# [Option] Install Docker CLI
ARG INSTALL_DOCKER="false"
COPY library-scripts/docker-debian.sh /tmp/scripts/
RUN if [ "${INSTALL_DOCKER}" = "true" ]; then \
        rm -f /usr/local/share/docker-init.sh \
        && bash /tmp/scripts/docker-debian.sh "true" "/var/run/docker-host.sock" "/var/run/docker.sock" "${USERNAME}"; \
    fi \
    && rm -rf /tmp/scripts && apt-get clean -y

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 \
    && sudo apt-add-repository -u https://cli.github.com/packages \
    && apt-get update \
    && apt-get -y install --no-install-recommends gh 

USER codespace

RUN npm install -g @angular/cli 
    
RUN az extension add --name azure-devops \
    && az extension add --name application-insights \
    && az extension add --name portal

ADD Microsoft.PowerShell_profile.ps1 /home/codespace/.config/powershell/Microsoft.PowerShell_profile.ps1