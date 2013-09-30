FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com"}
    name "John Doe"
    password "johndoe123"
  end
end