param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [ValidateSet('Start','Solution')]
    [string]$Action,
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$Exercise

)

#Requires -Version 7.0

$settingsDirectory = join-path $(git rev-parse --show-toplevel) ".workshop"
$settingsFile = join-path $settingsDirectory "settings.json"
$container = "localexercise"

if (-not (Test-Path -PathType Leaf $settingsFile))
{
    throw "Couldn't find settings file: $settingsFile"
}


try {
    Write-Host "Running Exercise $Exercise"
    & docker build -t $container $($settingsDirectory) | Out-Null
    & docker run --rm -e ACTION=$Action -e EXERCISE=$Exercise $container
}
finally {
    & docker rmi -f $container | Out-Null
}