describe Season do
  include_examples 'MovieValidations'

  describe 'Associations' do
    it { is_expected.to have_many(:episodes) }
  end
end
