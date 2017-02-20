require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :nickname }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_length_of(:nickname).is_at_most(100) }
    it { is_expected.to validate_length_of(:password).is_at_most(100) }
    it { is_expected.to allow_value('some@email').for(:email) }
    it { is_expected.not_to allow_value('@').for(:email) }
    it { is_expected.not_to allow_value('@email').for(:email) }
    it { is_expected.not_to allow_value('some.email').for(:email) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end
end
