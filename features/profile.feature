Feature: profiles
  
  @ncsu
  Scenario: index view
    Given the NCSU profile exists
    When I am on the profiles page
    Then I should see "Rare and Unique Materials"
    When I click on "Rare and Unique Materials"
    Then I should see "http://d.lib.ncsu.edu/collections"
    And I should see "Collection description"