FactoryBot.define do
  factory :movie do
    title { Faker::Book.title } # there is no Faker::Movie.title, Book.title is the closest match
    plot { Faker::Lorem.paragraph_by_chars(500) }
  end
end
