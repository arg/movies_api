describe Purchase do
  describe 'Constants' do
    describe 'DURATION' do
      subject { Purchase::DURATION }

      it { is_expected.to eq(2.days) }
    end
  end

  describe 'Enums' do
    it { is_expected.to define_enum_for(:option).with_values(price: 0, quality_hd: 1, quality_sd: 2) }
  end

  describe 'Associations' do
    subject { build(:purchase) }

    it { is_expected.to belong_to(:user).required }

    it { is_expected.to belong_to(:item).required }
  end

  describe 'Scopes' do
    describe '::active' do
      let!(:active_purchase) { create(:purchase) }

      let!(:inactive_purchase) { create(:purchase, :inactive_purchase) }

      subject { Purchase.active }

      it { is_expected.to contain_exactly(active_purchase) }
    end
  end

  describe 'Validations' do
    describe 'Active purchase/user uniqueness' do
      let(:user) { create(:user) }

      let(:movie) { build(:movie) }

      subject { user.purchases.create(item: movie, option: :price) }

      context 'When no same active purchases' do
        it { is_expected.to be_valid }
      end

      context 'When there is same active purchase' do
        before { create(:purchase, user: user, item: movie) }

        it { is_expected.not_to be_valid }

        its(:errors, [:item_id]) { is_expected.to contain_exactly('Item has already been taken') }
      end

      context 'When there is inactive purchase' do
        before { create(:purchase, :inactive_purchase, user: user, item: movie) }

        it { is_expected.to be_valid }
      end

      context 'When other purchase' do
        before { create(:purchase, user: user) }

        it { is_expected.to be_valid }
      end

      context 'When purchased by other user' do
        before { create(:purchase, item: movie) }

        it { is_expected.to be_valid }
      end
    end
  end

  describe 'Callbacks' do
    describe 'Set expires_at before create', freeze: true do
      let(:purchase) { create(:purchase, expires_at: expires_at) }

      subject { purchase.expires_at }

      context 'When expires_at is initially blank' do
        let(:expires_at) { nil }

        it { is_expected.to eq(Purchase::DURATION.from_now) }
      end

      context 'When expires_at is initially set' do
        let(:expires_at) { 7.days.from_now }

        it { is_expected.to eq(expires_at) }
      end
    end
  end
end
