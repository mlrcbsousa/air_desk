# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#--- Reseting DB (best to be in this order because of dependencies)
puts "Destroying all reviews..."
Review.destroy_all
puts "Destroying all bookings..."
Booking.destroy_all
puts "Destroying all offices..."
Office.destroy_all
puts "Destroying all users..."
User.destroy_all

#--- Generating Users

image_path = "app/assets/images/"

user = User.new(
  first_name: "Chris",
  last_name: "Sisserian",
  username: "cs",
  email: "cs@airdnc.com",
  password: "password",
  avatar: "#{image_path}chris.jpg"
)
user.save!

user = User.new(
  first_name: "Manuel",
  last_name: "Sousa",
  username: "ms",
  email: "ms@airdnc.com",
  password: "password"
  avatar: "#{image_path}manuel.jpg"
)
user.save!

user = User.new(
  first_name: "Antoine",
  last_name: "Welter",
  username: "aw",
  email: "aw@airdnc.com",
  password: "password"
  avatar: "#{image_path}antoine.jpg"
)
user.save!

user = User.new(
  first_name: "Thibaut",
  last_name: "De Briey",
  username: "tb",
  email: "tb@airdnc.com",
  password: "password"
  avatar: "#{image_path}thibaut.jpg"
)
user.save!

# For when we need uers that dont host offices
20.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'password'
  )
  # user.remote_avatar_url = Faker::Avatar.image
  user.save!
end

puts "Generated #{User.count} users in the database!"

#--- Generating Offices

locations = ["London", "Paris", "Berlin", "Lisbon", "Brussels", "Luxemburg", "Vienna", "Madrid", "Stockholm", "Milan"]
names = ["modern", "cool", "classic", "hipster", "traditional", "exciting", "clean",]
adjectives = ["amazing", "cheap", "high end", "fancy", "great value for money", "sophisticated", "alternative", "in demand", "unique", "pet friendly", "centrally located"]
descriptions = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

50.times do
  office = Office.new(
    location: locations.sample,
    # brilliant this
    name: "#{adjectives.sample.upcase} #{names.sample} office",
    description: descriptions,
    capacity: rand(2..20),
    dayrate: rand(20..200),
    # after we add the random users, if we want to keep the hosts as just us 4 we can change this line to
    user: User.find_by(username: %w[ms aw tb cs].sample)
  )
  office.save!
end
puts "Generated #{Office.count} users in the database!"

#--- Generating Bookings

40.times do
  Booking.create(
    start_date: Date.new(2019,rand(1..6),rand(1..28)),
    end_date: Date.new(2019,rand(7..12),rand(1..30)),
    user: User.all.sample,
    office: Office.all.sample
  )
end

puts "Generated #{Booking.count} bookings in the database!"

#--- Generating Reviews

Booking.limit(30).each do |booking|
  booking.review = Review.new(
    rating: rand(0..5),
    content: Faker::ChuckNorris.fact
  )
  booking.save
end

puts "Generated #{Review.count} reviews in the database!"
