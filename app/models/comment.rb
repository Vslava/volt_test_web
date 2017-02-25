class Comment < ApplicationRecord
  include PublishedAtAble
  include AuthorAble
  include ReportAble

  validates :body, :published_at, presence: true
  validates :body, length: { maximum: 10000 }
end
