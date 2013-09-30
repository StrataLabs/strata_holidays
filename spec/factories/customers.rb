# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name "MyString"
    address_1 "MyString"
    address_2 "MyString"
    city "MyString"
    state "MyString"
    country "MyString"
    lphone "MyString"
    mphone "MyString"
    email "MyString"
    comments "MyString"
    user_id 1
  end
end
