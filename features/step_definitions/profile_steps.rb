Given /^the NCSU profile exists$/ do
  FactoryGirl.create(:ncsu_profile)
end

When /^I am on the profiles page$/ do
  visit('/profiles')
end

Given /^I am on the NCSU profile page$/ do
  visit('/profiles')
  click_link('Rare and Unique Materials')
end

