describe 'v1/users/:id' do
  let(:parsed_response) { JSON.parse(response.body) }

  let!(:user) { create(:user) }

  let!(:other_user) { create(:user) }

  describe 'GET /purchases' do
    let!(:purchase) { create(:purchase, user: user) }

    let!(:inactive_purchase) { create(:purchase, :inactive_purchase, user: user) }

    let!(:purchase_by_other_user) { create(:purchase, user: other_user, item: purchase.item) }

    before { get(v1_purchases_path(user_id: user.id)) }

    it 'Returns successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'Returns only active purchases by current user' do
      expect(parsed_response).to match([{
        'expires_at' => purchase.expires_at.iso8601(3),
        'item_id' => purchase.item.id
     }])
    end
  end

  describe 'POST /purchases' do
    let(:item) { create(:movie) }

    let(:item_id) { item.id }

    let(:option) { 'quality_hd' }

    before { post(v1_purchases_path(user_id: user.id), params: { item_id: item_id, option: option }) }

    context 'When normal conditions', freeze: true do
      it 'Returns successful response' do
        expect(response).to have_http_status(:success)
      end

      describe 'Purchase' do
        subject { user.purchases }

        its(:size) { is_expected.to eq(1) }

        its('first.item') { is_expected.to eq(item) }

        its('first.option') { is_expected.to eq(option) }

        its('first.expires_at') { is_expected.to eq(Purchase::DURATION.from_now) }
      end
    end

    context 'When incorrect item_id passed' do
      let(:item_id) { 0 }

      it 'Returns successful response' do
        expect(response).to have_http_status(:not_found)
      end

      it 'Does not add any purchases to user' do
        expect(user.purchases).to be_empty
      end
    end

    context 'When active purchase already exists' do
      before { post(v1_purchases_path(user_id: user.id), params: { item_id: item_id, option: option }) }

      it 'Returns failure response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'Render errors' do
        expect(parsed_response).to match({
          'item_id' => ['has already been taken']
        })
      end

      it 'Does not create duplicating purchases' do
        expect(user.purchases.size).to eq(1)
      end
    end

    context 'When inactive purchase exists' do
      before { user.purchases.update(expires_at: 1.year.ago) }

      before { post(v1_purchases_path(user_id: user.id), params: { item_id: item_id, option: option }) }

      it 'Returns successful response' do
        expect(response).to have_http_status(:success)
      end

      it 'Creates a new purchase' do
        expect(user.purchases.size).to eq(1)
      end
    end
  end
end
