# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ncsu_profile, :class => Profile do
    name "Rare and Unique Materials"
    url "http://d.lib.ncsu.edu/collections"
    description "Collection description."
  end
end
