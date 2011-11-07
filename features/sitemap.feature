@ncsu
Feature: Sitemap Achievement

@ncsu_sitemap
Scenario: valid sitemap
  Given the NCSU profile exists
  And I am on the NCSU profile page
  When I click on "Sitemap"
  And I fill in a valid sitemap URL
  And I press "Create Sitemap"
  Then I should see "Sitemap was successfully created."
 
@no_sitemap
Scenario: invalid sitemap URL
  Given the NCSU profile exists
  And I am on the NCSU profile page
  When I click on "Sitemap"
  And I fill in an invalid sitemap URL
  And I press "Create Sitemap"
  Then I should see "error"
  And I should see "Url is invalid or not responding"

@bad_sitemap
Scenario: valid sitemap URL, but invalid sitemap
  Given the NCSU profile exists
  And I am on the NCSU profile page
  When I click on "Sitemap"
  And I fill in a valid URL for an invalid sitemap
  And I press "Create Sitemap"
  Then I should see "error"
  Then I should see "Url Element '{http://www.sitemaps.org/schemas/sitemap/0.9}sitemaps'"