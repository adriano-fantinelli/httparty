@REST
Feature: Activities

  @search_all_activities
  Scenario: Search for all activities
    When I send a GET request to find all activities
    Then the response must be all activities

  @create_activity
  Scenario: Create an activity
    When I send a POST request to create an activity
    Then the response must be the new activity

  @delete_activity
  Scenario: Delete an activity
    When I send a DELETE request to delete the activity '2'
    Then the response must be success

  @search_activity
  Scenario: Search for an activity
    When I send a GET request to find the activity '4'
    Then the response must be the activity 4

  @edit_activity
  Scenario: Edit an activity
    When I send a PUT request to edit the activity '4'
    Then the response must be the edited activity  
