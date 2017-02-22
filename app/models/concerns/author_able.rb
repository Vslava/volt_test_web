module AuthorAble
  extend ActiveSupport::Concern

  included do
    belongs_to :author, class_name: 'User', foreign_key: 'user_id'

    delegate :nickname, to: :author, prefix: true

    scope :group_by_author, ->{
      joins(:author).group('users.nickname','users.email')
    }
  end
end
