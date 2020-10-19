Set-Location $PSScriptRoot

$env:settingsLocation = ".\settings.json" 
$env:ACTION = "Start" #matches with the folder 
$env:EXERCISE = "CLOSELOOP-T002" 
$env:SOURCEREPO = "https://github.com/XpiritBV/CodeToCloud-Workshop" #This is the repo where all the solution files can be found.. Hardcoded in Docker file

#Load Settings
. ..\base-ghws-pwsh\init-helpers.ps1

. .\fixme.ps1  -isDebug $true

Run

