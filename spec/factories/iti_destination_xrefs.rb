# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :iti_destination_xref do
    iti_header_id 1
    destination_id 1
    destination_group_id 1
    dest_start_date "2013-06-19"
    dest_end_date "2013-06-19"
    season "MyString"
    duration 1
    no_of_people 1
  end
end
