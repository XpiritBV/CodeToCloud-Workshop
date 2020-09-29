Set-Location $PSScriptRoot

$env:settingsLocation = ".\settings.json" 
$env:ACTION = "Solution" #matches with the folder 
$env:EXERCISE = "DEVWF-T004" 
$env:SOURCEREPO = "https://github.com/XpiritBV/CodeToCloud-Workshop" #This is the repo where all the solution files can be found.. Hardcoded in Docker file

#Load Settings
. ..\base-ghws-pwsh\init-helpers.ps1

. .\fixme.ps1  -isDebug $true

Run
