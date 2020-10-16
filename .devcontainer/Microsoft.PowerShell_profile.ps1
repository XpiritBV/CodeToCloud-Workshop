/home/codespace/workspace/CodeToCloud-Source/.workshop/setup.ps1 -apply

function Workshop-Step
{
    [CmdletBinding()]
    param(
        [parameter(ValueFromRemainingArguments=$true)]
        [string[]]$Arguments
    )

    /home/codespace/workspace/CodeToCloud-Source/.workshop/workshop-step.ps1 @Arguments
}