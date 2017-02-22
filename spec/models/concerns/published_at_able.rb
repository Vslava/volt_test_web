RSpec.shared_examples 'published_at -able' do
  describe '.valid_published_at' do
    let(:parent_class) { described_class.name.underscore.to_sym }

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
end
