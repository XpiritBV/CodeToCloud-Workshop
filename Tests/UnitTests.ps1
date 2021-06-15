Describe 'The Challenges directory' {
  It 'Should contain' {
    Get-Item -Path "Challenges" | Should -Be $true
    Get-ChildItem -Path "Challenges" | Where-Object Name -like Module* | Should -HaveCount 4
  }

  It 'modules contain start/tasks/solution/step-by-step directories' {
    $Directories = @('Start', 'Solution', 'Tasks', 'Step-By-Step')
    $modules = @("1-ImprovingDeveloperFlow", "2-MovingToTheCloud", "3-ClosingTheFeedbackLoop")
    foreach ($modulenumber in $modules)
    {
      foreach ($dir in $Directories)
      {
        Get-ChildItem -Path "Challenges/Module$modulenumber" -Name | Should -Contain $dir
      }
    }
  }
}

# Describe 'The solution scripts' {
#   It 'Should be executable' {
#     ./Sources/.workshop/setup.ps1 << EOF
#       "github token"
#       "N"
#       "AzDo organization"
#       "AzDo token"
#       "Project name"
#       "Student name"
#       EOF
#     $Error.Count | Should -Be 0
#   }
# }
