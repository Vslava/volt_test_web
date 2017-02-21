require 'rails_helper'
require 'models/concerns/published_at_able'

RSpec.describe Comment, type: :model do
  it_behaves_like 'published_at -able'

  describe 'validations' do
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_length_of(:body).is_at_most(10000) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User').with_foreign_key('user_id') }
  end
end
