# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cust_iti_detail do
    cust_iti_header_id 1
    destination_id 1
    destination_group_id 1
    dest_start_date "2013-06-24"
    dest_end_date "2013-06-24"
    property_id 1
    created_at Time.zone.today
    updated_at Time.zone.today
  end
end
