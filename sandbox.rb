40.times do |n|
  puts "curl https://source.unsplash.com/collection/3107814/500x500/?sig=33 > app/assets/images/avatars/random_avatar_#{n + 1}"
end
