class Comment < ApplicationRecord
  include PublishedAtAble

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :body, :published_at, presence: true
  validates :body, length: { maximum: 10000 }
end
