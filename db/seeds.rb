# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "user@user.com",
            password: "password123")

(1..75).to_a.each do |i|
  Meetup.create(
    title: "This, right here, is meetup number: #{i}",
    datetime: "11:00",
    user_id: 1,
    description: "This is a sample meetup. A billionaire crimefighting
                  veterenarian wants to get lunch at your favorite restaurant!
                  He/she is going to Mars tomorrow, so you should request to
                  join them!"
  )
end
