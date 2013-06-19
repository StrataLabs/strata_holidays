# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :iti_day_detail do
    iti_header_id 1
    day_number 1
    points_of_attraction_id 1
    start_time "2013-06-19 14:59:03"
    end_time "2013-06-19 14:59:03"
    comments "MyString"
  end
end
