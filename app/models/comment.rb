# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :text
#  user_id      :integer
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_comments_on_user_id  (user_id)
#

class Comment < ApplicationRecord
  include PublishedAtAble
  include AuthorAble
  include ReportAble

  validates :body, :published_at, presence: true
  validates :body, length: { maximum: 10000 }
end
