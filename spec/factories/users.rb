FactoryGirl.define do
  factory :user do
    nickname Faker::Internet.user_name
    email Faker::Internet.email
    password Faker::Internet.password
  end
end
