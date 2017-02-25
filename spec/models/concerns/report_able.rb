RSpec.shared_examples 'report -able' do
  describe '#get_report_data' do
    let(:model_name_sym) { described_class.name.underscore.singularize.to_sym }

    it 'should create report data correctly' do
      user1 = create(:user, nickname: 'aaa', email: 'aaa@aaa')
      user2 = create(:user, nickname: 'bbb', email: 'bbb@bbb')

      create(model_name_sym, author: user1)
      create(model_name_sym, author: user1)
      create(model_name_sym, author: user1)
      create(model_name_sym, author: user2)
      create(model_name_sym, author: user2)

      info = described_class.get_report_data(Time.now - 1.day, Time.now + 1.day)

      expect(info.keys.size).to eq 2
      expect(info[['aaa', 'aaa@aaa']]).to eq 3
      expect(info[['bbb', 'bbb@bbb']]).to eq 2
    end
  end
end
