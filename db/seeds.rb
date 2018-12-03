# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user = User.new(first_name: "Chris", last_name: "Sisserian", username: "cs", email: "cs@airdnc.com", password: "password")
user.save!

user = User.new(first_name: "Manuel", last_name: "Sousa", username: "ms", email: "ms@airdnc.com", password: "password")
user.save!

user = User.new(first_name: "Antoine", last_name: "Welter", username: "aw", email: "aw@airdnc.com", password: "password")
user.save!

user = User.new(first_name: "Thibaut", last_name: "De Briey", username: "tb", email: "tb@airdnc.com", password: "password")
user.save!

Office.destroy_all

locations = ["London", "Paris", "Berlin", "Lisbon", "Brussels", "Luxemburg", "Vienna", "Madrid", "Stockholm", "Milan"]
names = ["modern", "cool", "classic", "hipster", "traditional", "exciting", "clean",]
adjectives = ["amazing", "cheap", "high end", "fancy", "great value for money", "sophisticated", "alternative", "in demand", "unique", "pet friendly", "centrally located"]
descriptions = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

50.times do
  office = Office.new(location: locations.sample, name: "#{adjectives.sample.upcase} #{names.sample} office", description: descriptions, capacity: rand(2..20), dayrate: rand(20..200), user: User.all.sample)
  office.save!
end
