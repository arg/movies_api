FactoryBot.define do
  factory :episode do
    season
    title { Faker::Book.title }
    plot { Faker::Lorem.paragraph_by_chars(500) }
  end
end
