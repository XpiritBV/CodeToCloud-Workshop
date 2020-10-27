FROM ghcr.io/xpiritbv/ghws-fix
WORKDIR /settings
ADD settings.json settings.json
WORKDIR /ghws
ENV settingsLocation=/settings/settings.json
CMD ["/usr/bin/pwsh" ,"fixme.ps1", "-Verbose"]