class Post < ApplicationRecord
  include PublishedAtAble
  include AuthorAble

  validates :title, :body, :published_at, presence: true
  validates :title, length: { maximum: 200 }
  validates :body, length: { maximum: 10000 }

  def self.count_by_period(start_date, end_date)
    by_published_at(start_date, end_date).group_by_author.count
  end
end
