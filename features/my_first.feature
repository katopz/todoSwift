Feature: Todo list application can add tasks  
  As a user
  I want to add tasks
  So I can remember to do things

Scenario: Add Task  
  Given I am on the Welcome Screen
  When I touch "Add"
  And I fill in "fooLabel" with "listening to Taylor Swift"
  And I touch "Add task"
  Then I wait for "listening to Taylor Swift" to appear