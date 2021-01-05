FROM mcr.microsoft.com/vscode/devcontainers/universal:linux

USER codespace

RUN npm install -g @angular/cli 
    
RUN az extension add --name azure-devops \
    && az extension add --name application-insights \
    && az extension add --name portal

ADD Microsoft.PowerShell_profile.ps1 /home/codespace/.config/powershell/Microsoft.PowerShell_profile.ps1
ADD Microsoft.PowerShell_profile.ps1 /home/codespace/.config/powershell/Microsoft.VSCode_profile.ps1
