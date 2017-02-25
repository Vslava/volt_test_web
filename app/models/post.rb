class Post < ApplicationRecord
  include PublishedAtAble
  include AuthorAble
  include ReportAble

  validates :title, :body, :published_at, presence: true
  validates :title, length: { maximum: 200 }
  validates :body, length: { maximum: 10000 }
end
