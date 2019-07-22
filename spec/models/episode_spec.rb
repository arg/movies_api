describe Episode do
  include_examples 'MovieValidations'

  describe 'Associations' do
    it { is_expected.to belong_to(:season) }
  end
end
