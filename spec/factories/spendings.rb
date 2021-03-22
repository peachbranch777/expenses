FactoryBot.define do
  factory :spending do
    price {Faker::Number.rand(1..100000000)}
    category {"趣味"}
    memo {"友人とゴルフ"}
    date { Faker::Date.between(from: '1930-01-01', to: '2050-12-31') }

    association :user
  end
end
