require 'rails_helper'
require 'models/concerns/published_at_able'

RSpec.describe Post, type: :model do
  it_behaves_like 'published_at -able'

  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_length_of(:title).is_at_most(200) }
    it { is_expected.to validate_length_of(:body).is_at_most(10000) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User').with_foreign_key('user_id') }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:nickname).to(:author).with_prefix(true) }
  end
end
