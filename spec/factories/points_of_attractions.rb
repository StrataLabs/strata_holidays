# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :points_of_attraction do
    destination_id 1
    poa_type_id 1
    name "MyString"
    description "MyString"
    comments "MyString"
  end
end
