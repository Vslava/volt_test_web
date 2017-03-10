# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string
#  body         :text
#  user_id      :integer
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

class Post < ApplicationRecord
  include PublishedAtAble
  include AuthorAble
  include ReportAble

  validates :title, :body, :published_at, presence: true
  validates :title, length: { maximum: 200 }
  validates :body, length: { maximum: 10000 }
end
