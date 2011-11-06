Feature: profiles

  Scenario: index view
    Given the following profile exists:
      | name     | url                    | description            |
      | Oddities | http://odd.example.org | collection description |
    When I am on the profiles page
    Then I should see "Oddities"
    When I click on "Oddities"
    Then I should see "http://odd.example.org"
    And I should see "collection description"