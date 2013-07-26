# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    context "MyText"
    commentable_id ""
    commentable_type "MyString"
  end
end
