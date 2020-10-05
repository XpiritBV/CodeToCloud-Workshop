param
(
    [bool] $isDebug = $false
)

$ProgressPreference="SilentlyContinue"

if (-not (Get-Module -Name powershell-yaml))
{
    Install-Module -Name powershell-yaml -Force -Repository PSGallery -Scope CurrentUser
}

function Invoke-GitHub {
<#
.Synopsis
Wrapper function that deals with Powershell's peculiar error output when Git uses the error stream.

.Example
Invoke-GitHub ThrowError
$LASTEXITCODE

#>
    [CmdletBinding()]
    param(
        [parameter(ValueFromRemainingArguments=$true)]
        [string[]]$Arguments
    )

    & {
        [CmdletBinding()]
        param(
            [parameter(ValueFromRemainingArguments=$true)]
            [string[]]$InnerArgs
        )
        if ($isDebug) { "gh $InnerArgs" }
        gh $InnerArgs
    } -ErrorAction SilentlyContinue -ErrorVariable fail @Arguments

    if ($fail) {
        $fail.Exception
    }

}

function Invoke-Git {
<#
.Synopsis
Wrapper function that deals with Powershell's peculiar error output when Git uses the error stream.

.Example
Invoke-Git ThrowError
$LASTEXITCODE

#>
    [CmdletBinding()]
    param(
        [parameter(ValueFromRemainingArguments=$true)]
        [string[]]$Arguments
    )

    & {
        [CmdletBinding()]
        param(
            [parameter(ValueFromRemainingArguments=$true)]
            [string[]]$InnerArgs
        )
        if ($isDebug) { "git $InnerArgs" }
        git $InnerArgs
    } -ErrorAction SilentlyContinue -ErrorVariable fail @Arguments

    if ($fail) {
        $fail.Exception
    }

}

function Get-PullRequestBody {
    [CmdletBinding()]
    param(
        [parameter()]
        [string] $fileName
    )
    
    $message = ((gc $fileName))

    # gc returns an array of lines, join them back up.
    $message = $message -join "`n"

    # strip frontmatter
    $message = $message -replace "---((?!---)(.|\n))+---",""

    # to pass the text to gh, we need to escape the quotes
    $message = $message -replace """", "\"""

    return $message
}

function Get-PullRequestProperties {
    [CmdletBinding()]
    param(
        [parameter()]
        [string] $fileName,

        $settings
    )

    $message = ((gc $fileName))

    # gc returns an array of lines, join them back up.
    $message = $message -join "`n"

    if ($message -match "(?<=---\n)((?!---)(.|\n))+")
    {
        $frontmatter = $Matches[0]
        $properties = ConvertFrom-Yaml $frontmatter
    }

    $content = Get-PullRequestBody $fileName
    
    if ($properties.linkedworkitem)
    {
        $workitemid = $settings.$("WorkItemId$($properties.LinkedWorkItem)")
        if (-not ($workitemid ))
        {
            throw "WorkitemId: $("WorkItemId$($properties.LinkedWorkItem)") not specified in settings file."
        }
        $content = "$content`n`nLinked to AB#$workitemid"
    }

    $markdown = @{
        Properties = $properties
        Content = $content
        FileName = $fileName
    }

    return $markdown
}

function Run {
    [CmdletBinding()]
    param()

    $settings = Get-GlobalSettings

    $token = $settings.GithubToken
    $sourceRepo = $env:SOURCEREPO
    $targetRepo = $settings.TargetRepo

    $action = $env:ACTION
    $exercise = $env:EXERCISE
    
    $sourceRepoFolder = Join-Path -path $pwd "source"
    $targetRepoFolder = Join-Path -path $pwd "target"


    $env:GIT_USER="."
    $env:GIT_PASS=$token
    Invoke-Git config --global credential.helper "!f() { echo \`"username=`${GIT_USER}`npassword=`${GIT_PASS}\`"; }; f"

    $env:GITHUB_TOKEN = $token
    Invoke-GitHub config set prompt disabled
    Invoke-GitHub config set -h github.com oauth_token $token

    if (Test-Path -PathType Container $sourceRepoFolder) {
        Remove-Item $sourceRepoFolder -Recurse -Force
    }
    if (Test-Path -PathType Container $targetRepoFolder) {
        Remove-Item $targetRepoFolder -Recurse -Force
    }

    Invoke-GitHub repo clone $sourceRepo $sourceRepoFolder

    # Find the right folder based on **/action/exercise/
    $markdownPathRoot = Get-ChildItem -Path $sourceRepoFolder -Include pr.md -File -Recurse | 
    where-object { $_.DirectoryName -like "*?$action*" } | 
    where-object { $_.DirectoryName -like "*?$exercise*" } | 
        select-object -ExpandProperty "DirectoryName" { $_.DirectoryName } 

    $markdownPath = Join-Path -path $markdownPathRoot "pr.md" 
    if (-not (Test-Path -Path $markdownPath)) {
        throw "Missing markdown file, expected here: $markdownPath"
    }

    $markDown = Get-PullRequestProperties $markdownPath $settings
    $branch = $markDown.Properties.Branch

    Invoke-GitHub repo clone $targetRepo $targetRepoFolder

    pushd $targetRepoFolder

    #To reset the target environment, run below line
    #Remove-Item * -Exclude ".git" -Recurse
    
    $solutionContentsPath = Join-Path -path $markdownPathRoot "contents"
    if (-not (Test-Path -PathType Container $solutionContentsPath)) {
        throw "Missing solution content, expected here: $solutionContentsPath"
    }
    Copy-Item (Join-Path -path $solutionContentsPath "*") $targetRepoFolder -Recurse

    Invoke-Git config user.name "$($markDown.Properties.Committer)"
    Invoke-Git config user.email "$($markDown.Properties.CommitterEmail)"

    Invoke-Git checkout -B $branch 
    Invoke-Git add . 
    Invoke-Git commit -m $markDown.Properties.CommitMessage
    Invoke-Git push origin $branch --force

    Invoke-GitHub pr create --body "$($markDown.Content)" --title "$($markDown.Properties.Title)"
    popd
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