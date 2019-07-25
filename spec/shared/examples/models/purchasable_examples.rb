shared_examples 'Purchasable' do
  describe 'Purchasable' do
    describe 'Associations' do
      it { is_expected.to have_many(:purchases).dependent(:destroy) }
    end

    describe '#purchase_by', freeze: true do
      let(:user) { create(:user) }

      let(:item) { create(described_class.name.underscore.to_sym) }

      let(:option) { :price }

      subject { item.purchase_by(user, option) }

      it { is_expected.to be_persisted }

      its(:user) { is_expected.to eq(user) }

      its(:purchasable) { is_expected.to eq(item) }

      its(:price?) { is_expected.to be_truthy }

      its(:expires_at) { is_expected.to eq(Purchase::DURATION.from_now) }

      context 'When incorrect option passed' do
        let(:option) { :incorrect }

        it 'Raises ArgumentError' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
