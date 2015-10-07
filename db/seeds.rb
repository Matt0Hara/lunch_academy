# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'securerandom'
User.create(email:"user@user.com", password:"password123")

75.times do
  Meetup.create(
    title: "#{SecureRandom.hex(2)}",
    datetime: DateTime.now,
    user_id: 1,
    description: SecureRandom.hex(32)
  )
end
