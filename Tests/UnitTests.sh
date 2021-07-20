#!/usr/bin/env bats

@test "The Challenges directory should contain Challenges" {
  result="$(ls ../Challenges | grep Module | wc -w)"
  [ "$result" -eq 4 ]
}

@test "Modules contain directories: start/step-by-step/solution/tasks" {
  directories=( "Start" "Solution" "Tasks" "Step-By-Step" ) 
  modules=( "1-ImprovingDeveloperFlow" "2-MovingToTheCloud" "3-ClosingTheFeedbackLoop" )
  for modulenumber in "$modules"
  {
    for dir in "$directories"
    {
      file="../Challenges/Module$modulenumber/$dir"
      # Ensure that directories exist
      [ -d "$file" ]
    }
  }
}

@test "The setup script should set variables in settings.json" {
    cat InputSetupScript.txt | pwsh ../Sources/.workshop/setup.ps1
    [ $? -eq 0 ]

    settings="$(cat ../Sources/.workshop/settings.json)"
    properties=("Student" 
                "AzDoPAT"
                "AzDoOrganization"
                "AzDoProject"
                "TargetRepo"
                "GithubToken"
                "WorkItemIdModule1"
                "WorkItemIdModule2"
                "WorkItemIdModule3"
                "WorkItemIdModule4")
    for property in $properties
    {
      content="$(echo $settings | jq .$property)"
      # Check that properties are not empty
      [[ "${content}" != "null" ]]
    }
}

# @test "Second run of setup script overwrites variables in settings.json" {
#     cat SecondInputSetupScript.txt | pwsh ../Sources/.workshop/setup.ps1
#     [ $? -eq 0 ]

#     settings="$(cat ../Sources/.workshop/settings.json)"
#     ghtoken="$(echo $settings | jq .GithubToken)"
#     azdotoken="$(echo $settings | jq .AzDoPAT)"
    
#     [[ "$ghtoken" == "newghtoken" ]]
#     [[ "$azdotoken" == "newazdotoken" ]]
# }
