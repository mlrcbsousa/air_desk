# #--- Reseting DB (best to be in this order because of dependencies)
# puts "Destroying all office attachments..."
# OfficeAttachment.destroy_all
# puts "Destroying all reviews..."
# Review.destroy_all
# puts "Destroying all bookings..."
# Booking.destroy_all
# puts "Destroying all offices..."
# Office.destroy_all
# puts "Destroying all users..."
# User.destroy_all

# #--- Generating Users

# first_name = %w[Chris Manuel Antoine Thibaut]
# last_name = ['Sisserian', 'Sousa', 'Welter', 'De Briey']
# username = %w[cs ms aw tb]
# email = %w[cs@airdnc.com ms@airdnc.com aw@airdnc.com tb@airdnc.com]
# avatar = %w[
#   https://kitt.lewagon.com/placeholder/users/sisserian
#   https://kitt.lewagon.com/placeholder/users/mlrcbsousa
#   https://kitt.lewagon.com/placeholder/users/welan125
#   https://kitt.lewagon.com/placeholder/users/Bitais
# ]

# 4.times do |n|
#   user = User.new(
#     first_name: first_name[n],
#     last_name: last_name[n],
#     username: username[n],
#     email: email[n],
#     password: "password",
#     remote_avatar_url: avatar[n]
#   )
#   user.save!
# end

# avatar_urls = JSON.parse(File.read("avatar_cloudinary_urls.json"), symbolize_names: true)

# 40.times do |n|
#   first_name, last_name = Faker::FunnyName.two_word_name.split
#   user = User.new(
#     email: Faker::Internet.unique.email,
#     password: 'password',
#     username: avatar_urls[n][:username],
#     # username: Faker::Internet.username("#{first_name} #{last_name}", %w(_)),
#     first_name: first_name,
#     last_name: last_name
#   )
#   user.remote_avatar_url = avatar_urls[n][:cloudinary_url]
#   user.save
# end

# # # user.remote_avatar_url = "https://source.unsplash.com/collection/3107814/300x300/?sig=#{n + 1}"

# puts "Generated #{User.count} users in the database!"

# #--- Generating Offices

# locations = ["London", "Paris", "Berlin", "Lisbon", "Brussels", "Luxemburg", "Vienna", "Madrid", "Stockholm", "Milan"]
# names = ["modern", "cool", "classic", "hipster", "traditional", "exciting", "clean",]
# adjectives = ["amazing", "cheap", "high end", "fancy", "great value for money", "sophisticated", "alternative", "in demand", "unique", "pet friendly", "centrally located"]
# descriptions = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

# office_attachment_urls = JSON.parse(File.read("office_attachment_cloudinary_urls.json"), symbolize_names: true)

# # Office.all.each do |office|
# #   office.name = "#{Faker::Lorem.unique.word} #{adjectives.sample.upcase} #{names.sample} office"
# #   office.save
# # end

# names = office_attachment_urls.map {|url| url[:office_name]}.uniq

# 37.times do |n|
#   office = Office.new(
#     location: "#{Faker::Address.street_address} #{locations.sample}",
#     name: names[n],
#     # name: "#{adjectives.sample.upcase} #{names.sample} office",
#     description: descriptions,
#     capacity: rand(2..20),
#     dayrate: rand(20..200),
#     user: User.all.sample
#   )
#   office.save!
# end

# puts "Generated #{Office.count} offices in the database!"

# #--- Generating Bookings

# 200.times do
#   Booking.create(
#     start_date: Date.new(2019,rand(1..6),rand(1..28)),
#     end_date: Date.new(2019,rand(7..12),rand(1..30)),
#     user: User.all.sample,
#     office: Office.all.sample
#   )
# end

# puts "Generated #{Booking.count} bookings in the database!"

# #--- Generating Reviews

# Booking.limit(140).each do |booking|
#   booking.review = Review.new(
#     rating: rand(0..5),
#     content: Faker::TheITCrowd.quote
#   )
#   booking.save
# end

# puts "Generated #{Review.count} reviews in the database!"

# #--- Generating Office Attachments

# 127.times do |n|
#   office_attachment = OfficeAttachment.new
#   office_attachment.remote_attachment_url = office_attachment_urls[n][:cloudinary_url]
#   office_attachment.office = Office.find_by(name: office_attachment_urls[n][:office_name])
#   office_attachment.save
# end

# puts "Generated #{OfficeAttachment.count} office attachments in the database!"


# # #---- BONUS: GENERATE JSON WITH CLOUDINARY URLs from local db per OfficeAttachment::Office.name

# # array = []

# # OfficeAttachment.all.each do |office_attachment|
# #   array << {
# #     office_name: office_attachment.office.name,
# #     cloudinary_url: office_attachment.attachment.url
# #   }
# # end

# # File.open('office_attachment_cloudinary_urls.json', 'w') do |f|
# #   f.write(JSON.pretty_generate(array))
# # end

# # #---- BONUS: GENERATE JSON WITH CLOUDINARY URLs from local db per User::username

# # array = []

# # User.all.each do |user|
# #   array << {
# #     username: user.username,
# #     cloudinary_url: user.avatar.url
# #   }
# # end

# # File.open('avatar_cloudinary_urls.json', 'w') do |f|
# #   f.write(JSON.pretty_generate(array))
# # end
