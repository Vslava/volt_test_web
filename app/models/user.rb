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

class User < ApplicationRecord
  has_secure_password

  mount_uploader :avatar, AvatarUploader

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :nickname, :email, presence: true
  validates :nickname, length: { maximum: 100 }
  validates :password, presence: true, on: :create
  validates :password, length: { maximum: 100 }, on: :create
  validates :email, format: /\A[^@\s]+@[^@\s]+\z/
end
