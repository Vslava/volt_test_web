class Post < ApplicationRecord
  include PublishedAtAble

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  delegate :nickname, to: :author, prefix: true

  validates :title, :body, :published_at, presence: true
  validates :title, length: { maximum: 200 }
  validates :body, length: { maximum: 10000 }
end
