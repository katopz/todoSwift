Feature: Todo 
  As an user
  I want to add tasks
  So I can remember to do them

Scenario: Adding a task
  Given I am on the Welcome Screen
  When I touch "Add"
  And I fill in "TaskText" with "Clean the Floors"
  And I touch "AddTask"
  Then I wait for "Clean the Floors" to appear
  And take picture


