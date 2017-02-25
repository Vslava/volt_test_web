require 'rails_helper'
require 'models/concerns/published_at_able'
require 'models/concerns/author_able'
require 'models/concerns/report_able'

RSpec.describe Post, type: :model do
  it_behaves_like 'published_at -able'
  it_behaves_like 'author -able'
  it_behaves_like 'report -able'

  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_length_of(:title).is_at_most(200) }
    it { is_expected.to validate_length_of(:body).is_at_most(10000) }
  end
end
