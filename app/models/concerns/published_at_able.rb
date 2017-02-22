module PublishedAtAble
  extend ActiveSupport::Concern

  included do
    before_validation :valid_published_at

    scope :by_published_at, ->(start_date, end_date) {
      where(published_at: start_date..end_date)
    }
  end

  private

  def valid_published_at
    self.published_at = Time.now if published_at.blank?
  end
end
