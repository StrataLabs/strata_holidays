# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :iti_detail do
    iti_header_id 1
    destination_id 1
    day_number 1
    property_id 1
    iti_date "2013-06-19"
  end
end
