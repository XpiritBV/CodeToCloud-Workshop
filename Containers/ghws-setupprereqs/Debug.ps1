Set-Location $PSScriptRoot

$env:settingsLocation = "C:\Users\rvano\source\repos\github\Cloud-Native-In-a-Day\Prerequisites\Containers\base-ghws-pwsh\settingsrene.json"
#Load Settings
. ..\base-ghws\init-helpers.ps1

. .\SetupPreReqs.ps1  -isDebug $true

Run

