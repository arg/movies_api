FactoryBot.define do
  factory :purchase do
    user
    option { Purchase.options[:price] }
    with_purchased_movie

    trait :inactive_purchase do
      expires_at { 1.day.before(Purchase::DURATION.ago) }
    end

    trait :with_purchased_movie do
      association :purchasable, factory: :movie
    end

    trait :with_purchased_season do
      association :purchasable, factory: :season
    end
  end
end
