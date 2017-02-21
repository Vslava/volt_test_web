module PublishedAtAble
  extend ActiveSupport::Concern

  included do
    before_validation :valid_published_at
  end

  private

  def valid_published_at
    self.published_at = Time.now if published_at.blank?
  end
end
