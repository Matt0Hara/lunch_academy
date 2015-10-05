require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :meetup do
    title "The name of the meetup, man."
    description "Let's see if we can get Dominos to deliver to another Dominos!"
    user
    datetime DateTime.now
  end
end
