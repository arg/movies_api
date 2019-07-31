describe '/v1/library' do
  let(:parsed_response) { JSON.parse(response.body) }

  let!(:movie) { create(:movie, created_at: 1.year.ago) }

  let!(:season) { create(:season_with_episodes, episodes_count: 2, created_at: 2.years.ago) }

  describe 'GET /all' do
    before { get(v1_all_path) }

    it 'Returns successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'Returns seeasons and movies' do
      expect(parsed_response).to match(
        [
          {
            'id' => season.id,
            'type' => 'Season',
            'title' => season.title,
            'plot' => season.plot
          },
          {
            'id' => movie.id,
            'type' => 'Movie',
            'title' => movie.title,
            'plot' => movie.plot
          }
        ]
      )
    end
  end

  describe 'GET /movies' do
    before { get(v1_movies_path) }

    it 'Returns successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'Returns list of movies' do
      expect(parsed_response).to match(
        [
          {
            'id' => movie.id,
            'title' => movie.title,
            'plot' => movie.plot
          }
        ]
      )
    end
  end

  describe 'GET /seasons' do
    before { get(v1_seasons_path) }

    it 'Returns successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'Returns list of seasons' do
      expect(parsed_response).to match(
        [
          {
            'id' => season.id,
            'title' => season.title,
            'plot' => season.plot,
            'episodes' => [
              {
                'position' => 1,
                'title' => season.episodes[0].title,
                'plot' => season.episodes[0].plot
              },
              {
                'position' => 2,
                'title' => season.episodes[1].title,
                'plot' => season.episodes[1].plot
              }
            ]
          }
        ]
      )
    end
  end
end
