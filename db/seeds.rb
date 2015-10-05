# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email:"user@user.com", password:"password123")

(1..10).to_a.each do |index|
  Meetup.create(title:"Spaghetti?", description:"You WILL get spaghetti.", user_id:1, datetime:DateTime.now)
end
