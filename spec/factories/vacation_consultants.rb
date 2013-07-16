# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vacation_consultant do
    name "MyString"
    address_1 "MyString"
    address_2 "MyString"
    city "MyString"
    state "MyString"
    preferred_neighborhood "MyString"
    planning false
    booking false
    preferred_locations "MyString"
    lphone "MyString"
    mphone "1234567890"
    email "MyString"
    comments "MyString"
    country "MyString"
  end
end