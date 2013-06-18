# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :property do
    destination_id 1
    name "MyString"
    type ""
    official_rating "MyString"
    customer_rating "MyString"
    restaurent false
    pool false
    funzoze false
    comments "MyString"
  end
end
