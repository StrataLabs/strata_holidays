# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :property do
    destination_id 1
    name "MyString"
    property_type "MyString"
    official_rating "MyString"
    customer_rating "MyString"
    restaurant false
    pool false
    fun_zone false
    comments "MyString"
  end
end
