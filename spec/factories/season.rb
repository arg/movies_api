FactoryBot.define do
  factory :season do
    title { Faker::Book.title } # there is no Faker::Movie.title, Book.title is the closest match
    plot { Faker::Lorem.paragraph_by_chars(500) }

    factory :season_with_episodes do
      transient do
        episodes_count { 3 }
      end

      after(:create) do |season, evaluator|
        create_list(:episode, evaluator.episodes_count, season: season)
      end
    end
  end
end
