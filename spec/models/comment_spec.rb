require 'rails_helper'
require 'models/concerns/published_at_able'
require 'models/concerns/author_able'

RSpec.describe Comment, type: :model do
  it_behaves_like 'published_at -able'
  it_behaves_like 'author -able'

  describe 'validations' do
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_length_of(:body).is_at_most(10000) }
  end
end
