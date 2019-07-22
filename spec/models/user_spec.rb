describe User do
  describe 'Associations' do
  end

  describe 'Validations' do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_length_of(:email).is_at_most(160) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
end
