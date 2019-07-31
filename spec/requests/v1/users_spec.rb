describe '/v1/users' do
  let(:parsed_response) { JSON.parse(response.body) }

  describe 'GET /:id' do
    let(:user) { create(:user) }

    before { get(v1_user_path(user_id: user.id)) }

    it 'Returns successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'Returns correct JSON data' do
      expect(parsed_response).to match('id' => user.id, 'email' => user.email)
    end
  end
end
