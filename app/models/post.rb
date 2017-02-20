class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  delegate :nickname, to: :author, prefix: true

  validates :title, :body, :published_at, presence: true
  validates :title, length: { maximum: 200 }
  validates :body, length: { maximum: 10000 }

  before_validation :valid_published_at

  private

  def valid_published_at
    self.published_at = Time.now if published_at.blank?
  end
end
