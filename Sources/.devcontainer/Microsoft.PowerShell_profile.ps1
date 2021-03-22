$workspacePaths = @("/home/codespace/workspace/", "/workspaces/")
$workshopPath = ""

foreach ($path in $workspacePaths){
    if (Test-Path $path){
        $workshopPath = Get-ChildItem -Path $path -Include ".workshop" -Recurse -Directory -Hidden | select-object -ExpandProperty "FullName" { $_.FullName }
        break
    }
}

if (-not $workshopPath){
    Write-Error "Workspace folder not in the expected location."
}

$setupScript = join-path $workshopPath "setup.ps1"
$workshopStepScript = join-path $workshopPath "workshop-step.ps1"

Invoke-Expression "$setupScript -apply"

function Workshop-Step
{
    [CmdletBinding()]
    param(
        [parameter(ValueFromRemainingArguments=$true)]
        [string[]]$Arguments
    )

    Invoke-Expression "$workshopStepScript @Arguments" 
}
