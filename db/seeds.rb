require 'faker'
# movies
movie1 = Movie.create!(title: Faker::Book.title, plot: Faker::Lorem.paragraph)
movie2 = Movie.create!(title: Faker::Book.title, plot: Faker::Lorem.paragraph)
# seasons
season1 = Season.create!(title: Faker::Book.title, plot: Faker::Lorem.paragraph)
season2 = Season.create!(title: Faker::Book.title, plot: Faker::Lorem.paragraph)
# episodes
Episode.create!(title: Faker::Book.title, plot: Faker::Lorem.paragraph, season: season1)
Episode.create!(title: Faker::Book.title, plot: Faker::Lorem.paragraph, season: season1)
Episode.create!(title: Faker::Book.title, plot: Faker::Lorem.paragraph, season: season1)
Episode.create!(title: Faker::Book.title, plot: Faker::Lorem.paragraph, season: season2)
Episode.create!(title: Faker::Book.title, plot: Faker::Lorem.paragraph, season: season2)
# users
user1 = User.create!(email: Faker::Internet.email)
user2 = User.create!(email: Faker::Internet.email)
# purchases
user1.purchases.create!(item: movie1, option: :price)
user1.purchases.create!(item: season1, option: :quality_hd)
