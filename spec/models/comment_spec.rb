require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_length_of(:body).is_at_most(10000) }

    describe '#valid_published_at' do
      context 'when published_at is empty' do
        it 'should automatically create the date' do
          user = create(:user)
          post = create(:post, author: user, published_at: nil)
          expect(post.published_at).not_to eq nil
        end
      end

      context 'when pubslished_at is valid date' do
        it 'should successfully save the date' do
          time = Time.now
          user = create(:user)
          post = create(:post, author: user, published_at: time.to_s)
          expect(post.published_at.utc.to_s).to eq time.utc.to_s
        end
      end
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User').with_foreign_key('user_id') }
  end
end
