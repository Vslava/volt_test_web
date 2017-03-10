# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string
#  body         :text
#  user_id      :integer
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :post do
    title Faker::Lorem.sentence
    body Faker::Lorem.sentences.join(' ')
    association :author, factory: :user
    published_at Time.now.to_s
  end
end
