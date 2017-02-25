FactoryGirl.define do
  factory :comment do
    body Faker::Lorem.sentences.join(' ')
    association :author, factory: :user
    published_at Time.now.to_s
  end
end
