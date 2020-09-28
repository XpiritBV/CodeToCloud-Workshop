Set-Location $PSScriptRoot

$env:settingsLocation = ".\settings.json"
$env:ACTION = "Solution"
$env:EXERCISE = "DEVWF-T004"
$env:SOURCEREPO = "https://github.com/XpiritBV/CodeToCloud-Workshop"

#Load Settings
. ..\base-ghws-pwsh\init-helpers.ps1

. .\fixme.ps1  -isDebug $true

Run

