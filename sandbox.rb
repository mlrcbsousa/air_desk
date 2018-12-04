# use this for testing purposes for ruby code to run in `irb` and other stuff

images = %w[thibaux manuel chris antoine]

4.times do |n|
  Cloudinary::Uploader.upload(
    "app/assets/images/#{images[n]}.jpg",
    folder: 'lewagon/airdesk/admins/',
    public_id: images[n].to_s
  )
end
