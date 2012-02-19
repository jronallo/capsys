# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "MyString"
    uid "MyString"
    name "MyString"
    nickname "MyString"
    image "MyString"
    description "MyString"
    website "MyString"
    twitter "MyString"
  end
end
