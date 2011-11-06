# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    name "Oddities"
    url "http://odd.example.org"
    description "Description of oddities."
  end
end
