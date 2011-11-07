When /^I fill in a valid sitemap URL$/ do
  fill_in 'Url', :with => 'http://d.lib.ncsu.edu/collections/sal-sitemap.xml'
end

When /^I fill in an invalid sitemap URL$/ do
  fill_in 'Url', :with => 'http://example.org/collection'
end

When /^I fill in a valid URL for an invalid sitemap$/ do
  fill_in 'Url', :with => 'http://d.lib.ncsu.edu/collections/bad-sitemap.xml'
end
