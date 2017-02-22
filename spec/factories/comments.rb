FactoryGirl.define do
  factory :comment do
    body "My Title"
    association :author, factory: :user
    published_at "2017-02-18 09:58:29"
  end
end
