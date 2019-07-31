describe Episode do
  include_examples 'Item Validations'

  describe 'Associations' do
    it { is_expected.to belong_to(:season) }
  end

  describe 'Positions' do
    let(:season) { create(:season, episodes: create_list(:episode, 3)) }

    subject { season.episodes.pluck(:position) }

    it { is_expected.to contain_exactly(1, 2, 3) }
  end
end
