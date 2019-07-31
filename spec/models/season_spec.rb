describe Season do
  it { is_expected.to be_kind_of(Item) }

  describe 'Associations' do
    it { is_expected.to have_many(:episodes).order(position: :asc).dependent(:destroy) }
  end
end
