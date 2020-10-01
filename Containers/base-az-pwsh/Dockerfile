FROM mcr.microsoft.com/azure-cli
RUN apk add --no-cache \
    ca-certificates \
    less \
    ncurses-terminfo-base \
    krb5-libs \
    libgcc \
    libintl \
    libssl1.1 \
    libstdc++ \
    tzdata \
    userspace-rcu \
    zlib \
    icu-libs \
    curl
RUN apk -X https://dl-cdn.alpinelinux.org/alpine/edge/main add --no-cache \
    lttng-ust
# Download 7 install GitHub CLI
RUN curl -L https://github.com/cli/cli/releases/download/v1.0.0/gh_1.0.0_linux_amd64.tar.gz -o /tmp/gh_1.0.0_linux_amd64.tar.gz
RUN mkdir -p /opt/github/cli/1
RUN tar zxf /tmp/gh_1.0.0_linux_amd64.tar.gz -C /opt/github/cli/
RUN rm /tmp/gh_1.0.0_linux_amd64.tar.gz
RUN chmod +x /opt/github/cli/gh_1.0.0_linux_amd64/bin/gh
RUN ln -s /opt/github/cli/gh_1.0.0_linux_amd64/bin/gh /usr/bin/gh
# Download the powershell '.tar.gz' archive
RUN curl -L https://github.com/PowerShell/PowerShell/releases/download/v7.0.1/powershell-7.0.1-linux-alpine-x64.tar.gz -o /tmp/powershell.tar.gz
# Create the target folder where powershell will be placed
RUN mkdir -p /opt/microsoft/powershell/7
# Expand powershell to the target folder
RUN tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7
RUN rm /tmp/powershell.tar.gz
# Set execute permissions
RUN chmod +x /opt/microsoft/powershell/7/pwsh
# Create the symbolic link that points to pwsh
RUN ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh
# Start PowerShell
RUN ["pwsh", "-Command", "install-module az -force"]
RUN az extension add --name azure-devops
RUN az extension add --name application-insights
RUN az extension add --name portal
RUN ["pwsh", "-Command", "install-module powershell-yaml -Force -Repository PSGallery"]
