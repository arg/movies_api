shared_examples 'Item Validations' do
  describe 'Item Validations' do
    it { is_expected.to validate_presence_of(:title) }

    it { is_expected.to validate_length_of(:title).is_at_most(160) }

    it { is_expected.to validate_presence_of(:plot) }

    it { is_expected.to validate_length_of(:plot).is_at_most(500) }
  end
end
