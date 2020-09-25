$settings = $null
function Get-GlobalSettings
{

    if ($null -eq $settings) {
        $fileContents = Get-Content -Path $($env:settingsLocation)
        
        $settings = $fileContents | ConvertFrom-Json
    }
    return $settings
}

function Login-ToAzure
{
    $settings = Get-GlobalSettings
    az login --service-principal --username $($settings.AzureOwnerSPN) --password $($settings.AzureOwnerSPNSecret) --tenant $($settings.TenantID) | Out-Null
}

function Login-ToAzureDevOps
{
    $settings = Get-GlobalSettings
    $env:AZURE_DEVOPS_EXT_PAT = $($settings.AzDoPAT)
    az devops configure --defaults organization=https://dev.azure.com/$($settings.AzDoOrganization)
    Track-AITrace -message "Logged in by setting PAT"

}

function New-TemporaryDirectory {
  $parent = [System.IO.Path]::GetTempPath()
  [string] $name = [System.Guid]::NewGuid()
  $var = New-Item -ItemType Directory -Path (Join-Path $parent $name)
  return $var
}


