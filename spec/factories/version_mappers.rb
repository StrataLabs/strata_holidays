# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :version_mapper do
    value 1
    children "MyString"
    modeltype "MyString"
    model_id 1
  end
end
