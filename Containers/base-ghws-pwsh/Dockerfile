FROM ghcr.io/xpiritbv/base-az-pwsh:latest
ARG file
ENV settingsLocation=$file
WORKDIR ghws
ADD ./init-helpers.ps1 ./ghws-helpers.ps1 ./
