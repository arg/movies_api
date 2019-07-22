FactoryBot.define do
  factory :user do
    email { |attributes| Faker::Internet.email }
  end
end
