FactoryBot.define do
  factory :user do
    name {Faker::Name}
    email {Faker::Internet.free_email}
    password {'aaaaa1'}
    password_confirmation {password}
  end
end