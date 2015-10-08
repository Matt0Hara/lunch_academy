# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "securerandom"
User.create(email:"#{SecureRandom.hex(4)} + @ + #{SecureRandom.hex(5)} + .com", password:"password123")

75.times do
  Meetup.create(
    title: "#{SecureRandom.hex(2)}",
    datetime: DateTime.now,
    user_id: 1,
    description: "Ugh I CANNOT believe that I couldn't generate this dynamically. Not only will I despise typing this, but every reload of my page will be a grim reminder of my shortcomings."
  )
end
