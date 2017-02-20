class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :nickname, :email, :password, presence: true
  validates :nickname, length: { maximum: 100 }
  validates :password, length: { maximum: 100 }
  validates :email, format: /\A[^@\s]+@[^@\s]+\z/
end
