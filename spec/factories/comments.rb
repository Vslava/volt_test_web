# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :text
#  user_id      :integer
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_comments_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :comment do
    body Faker::Lorem.sentences.join(' ')
    association :author, factory: :user
    published_at Time.now.to_s
  end
end
