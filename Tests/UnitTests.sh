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
