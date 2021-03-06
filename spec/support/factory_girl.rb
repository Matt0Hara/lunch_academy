require "factory_girl"
require "factory_girl_rails"

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :meetup do
    sequence(:title) { |n| "This is meetup number #{n}." }
    description "Let's see if we can get Dominos to deliver to another Dominos!"
    user
    datetime DateTime.now
  end
end
