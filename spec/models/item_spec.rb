describe Item do
  include_examples 'Item Validations'

  describe 'Associations' do
    it { is_expected.to have_many(:purchases).dependent(:destroy) }
  end

  describe 'Scopes' do
    describe '::order_by_created' do
      let!(:item1) { create(:movie, created_at: 1.week.ago) }

      let!(:item2) { create(:movie, created_at: 2.weeks.ago) }

      subject { Movie.order_by_created }

      it { is_expected.to eq([item2, item1]) }
    end
  end
end
