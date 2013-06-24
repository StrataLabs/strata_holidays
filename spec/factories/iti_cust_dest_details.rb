# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :iti_cust_dest_detail do
    cust_iti_detail_id 1
    dest_iti_detail 1
    preferred_time_of_arrival "2013-06-24 12:16:31"
    preferred_time_of_departure "2013-06-24 12:16:31"
    comments "MyString"
  end
end
