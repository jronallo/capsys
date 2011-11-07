Then /^I should see "([^"]*)"$/ do |arg1|
  page.should have_content(arg1)
end

When /^I click on "([^"]*)"$/ do |arg1|
  click_link(arg1)
end

When /^I press "([^"]*)"$/ do |arg1|
  click_button(arg1)
end

Then /^show me the page$/ do
  save_and_open_page
end
