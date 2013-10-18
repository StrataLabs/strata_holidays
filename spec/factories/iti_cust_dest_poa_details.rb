# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :iti_cust_dest_poa_detail do
    cust_iti_detail_id 1
    dest_iti_detail_id 1
    day_number 1
    points_of_attraction_id 1
    preferred_time_of_arrival "2013-06-25 15:02:55"
    preferred_time_of_departure "2013-06-25 15:02:55"
  end
end
