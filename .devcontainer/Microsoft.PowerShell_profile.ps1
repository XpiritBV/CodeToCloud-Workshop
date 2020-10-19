$workshopPath = Get-ChildItem -Path "/home/codespace/workspace/" -Include ".workshop" -Recurse -Directory -Hidden | select-object -ExpandProperty "FullName" { $_.FullName }
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
