FactoryGirl.define do
  factory :post do
    title Faker::Lorem.sentence
    body Faker::Lorem.sentences.join(' ')
    association :author, factory: :user
    published_at Time.now.to_s
  end
end
