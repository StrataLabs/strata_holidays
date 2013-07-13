# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cust_iti_request do
    customer_id 1
    dest_type "MyString"
    destinations ["MyString","adsf"]
    vacation_type_id 1
    start_date "2013-07-04"
    end_date "2013-07-04"
    no_of_adults 1
    no_of_children 1
  end
end
