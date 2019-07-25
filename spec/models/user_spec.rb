describe User do
  describe 'Associations' do
    it { is_expected.to have_many(:purchases).dependent(:destroy) }

    describe 'Association scopes' do
      describe 'has_many :purchases -> active' do
        let(:user) { create(:user) }

        let(:active_purchase) { create(:purchase, user: user) }

        let(:inactive_purchase) { create(:purchase, :inactive_purchase, user: user) }

        subject { user.purchases }

        it { is_expected.to contain_exactly(active_purchase) }
      end
    end
  end

  describe 'Validations' do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_length_of(:email).is_at_most(160) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
end
