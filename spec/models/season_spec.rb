describe Season do
  include_examples 'MovieValidations'

  include_examples 'Purchasable'

  describe 'Associations' do
    it { is_expected.to have_many(:episodes).order(position: :asc).dependent(:destroy) }
  end
end
