# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vc_registration do
    name "MyString"
    address_1 "MyString"
    address_2 "MyString"
    city "MyString"
    state "MyString"
    preferred_neighborhood "MyString"
    planning false
    booking false
    preferred_locations ["1","2","3","4"]
    lphone "MyString"
    mphone "1234567890"
    sequence(:email) {|n| "person#{n}@example.com"}
    comments "MyString"
    country "MyString"
    status "New"
  end
end