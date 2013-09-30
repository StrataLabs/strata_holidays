# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :destinations_vacation_consultant, :class => 'DestinationsVacationConsultants' do
    vacation_consultant_id 1
    destination 1
  end
end
