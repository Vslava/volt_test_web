RSpec.shared_examples 'author -able' do
  let(:parent_class) { described_class.name.underscore.to_sym }

  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User').with_foreign_key('user_id') }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:nickname).to(:author).with_prefix(true) }
  end

  describe 'scopes' do
    describe '.group_by_author' do
      it {
        user1 = create(:user, nickname: 'name1', email: 'name1@email.ru')
        user2 = create(:user, nickname: 'name2', email: 'name2@email.ru')
        create(parent_class, author: user1)
        create(parent_class, author: user1)
        create(parent_class, author: user2)
        create(parent_class, author: user2)

        items = described_class.group_by_author.count

        expect(items.keys).to contain_exactly(
          [user1.nickname, user1.email],
          [user2.nickname, user2.email]
        )
      }
    end
  end
end
