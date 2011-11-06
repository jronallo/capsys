Feature: profiles

  Scenario: index view
    Given the following profile exists:
      | name     | url                    |
      | Oddities | http://odd.example.org |
    When I am on the profiles page
    Then I should see "Oddities"
    When I follow "Oddities"
    Then I should see "http://odd.example.org"