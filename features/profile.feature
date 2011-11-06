Feature: profiles

  Scenario: index view
    Given the following profile exists:
      | name     | url                               | description            |
      | Oddities | http://d.lib.ncsu.edu/collections | collection description |
    When I am on the profiles page
    Then I should see "Oddities"
    When I click on "Oddities"
    Then I should see "http://d.lib.ncsu.edu/collections"
    And I should see "collection description"