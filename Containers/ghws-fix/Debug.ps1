Set-Location $PSScriptRoot

$env:settingsLocation = ".\settings.json"
#Load Settings
. ..\base-ghws-pwsh\init-helpers.ps1

. .\fixme.ps1  -isDebug $true

Run

