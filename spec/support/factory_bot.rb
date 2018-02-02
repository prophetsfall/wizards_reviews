require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:user_name) { |n| "user#{n}"}
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    role 'admin'
  end
end

FactoryBot.define do
  factory :wizard do
    sequence(:name) { |n| "wizard#{n}"}
    description "I'm a bloody wizard!"
    creator_id 1
  end
end
FactoryBot.define do
  factory :review do
    body "This wizard rules!"
    rating 3
  end
end
