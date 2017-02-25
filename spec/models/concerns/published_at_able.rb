RSpec.shared_examples 'published_at -able' do
  let(:parent_class) { described_class.name.underscore.to_sym }

  describe '.valid_published_at' do
    context 'when published_at is empty' do
      it 'should automatically create the date' do
        post = create(parent_class, published_at: nil)
        expect(post.published_at).not_to eq nil
      end
    end

    context 'when pubslished_at is valid date' do
      it 'should successfully save the date' do
        time = Time.now
        post = create(parent_class, published_at: time.to_s)
        expect(post.published_at.utc.to_s).to eq time.utc.to_s
      end
    end
  end

  describe 'scopes' do
    describe '.by_published_at' do
      it 'should successfully get items in the time period' do
        items = []
        items << create(parent_class, published_at: Time.now - 3.days)
        items << create(parent_class, published_at: Time.now - 2.days)
        items << create(parent_class, published_at: Time.now - 1.days)
        items << create(parent_class, published_at: Time.now)
        items << create(parent_class, published_at: Time.now + 1.days)
        items << create(parent_class, published_at: Time.now + 2.days)
        items << create(parent_class, published_at: Time.now + 3.days)

        res = described_class.by_published_at(Time.now - 2.days - 1.hour,Time.now + 1.days)
        expect(res.pluck(:id)).to contain_exactly(items[1].id, items[2].id, items[3].id, items[4].id)
      end
    end
  end
end
