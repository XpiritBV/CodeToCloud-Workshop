param
(
    [bool] $isDebug = $false
)

    function Run {
        [CmdletBinding()]
        param()

        $settings = Get-GlobalSettings
        Write-Host "This is a global Setting $($settings.AzureOwnerSPN)"
        Login-ToAzure

        # Step 1 - Create Resource Group
        az group create -l $($settings.ResourceGroupLocation) -n "$($settings.ResourceGroupName)-$($settings.StudentNickName)"
    }


    $settings = $null
    if ($isDebug -eq $false) {
        . ./init-helpers.ps1
        try {
            Run
        }
        catch {
            throw $_.Exception
        }

    }

