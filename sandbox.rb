# images = [
#   'Annanda.jpg',
#   'Ben.jpg',
#   'Carlotta.jpg',
#   'Carolina.jpg',
#   'Clelia.jpg',
#   'Clement.jpg',
#   'Daniel.jpg',
#   'Emily.jpg',
#   'Hellena.jpg',
#   'Ines.jpg',
#   'Jami.jpg',
#   'jonny.jpg',
#   'Mathilde.jpg',
#   'Nick.jpg',
#   'Paul.png',
#   'Shannon.jpg',
#   'Thomas.jpg',
#   'Vasco.jpg'
# ]

# images.each do |image|
#   Cloudinary::Uploader.upload("app/assets/images/batch205/#{image}",
#                               folder: "lewagon/airdesk/Classmates/",
#                               public_id: image.split('.')[0]
#                               )
# end

<%= form_for [office, office_attachment] do |f| %>
  <div class="field">
    <%= f.label :attachment %><br>
    <%= f.file_field :attachment %>
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>
