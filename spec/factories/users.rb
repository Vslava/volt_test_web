# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  nickname        :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  avatar          :string
#

FactoryGirl.define do
  factory :user do
    nickname Faker::Internet.user_name
    email Faker::Internet.email
    password Faker::Internet.password
  end
end
