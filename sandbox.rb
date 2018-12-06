# use this for testing purposes for ruby code to run in `irb` and other stuff

Cloudinary::Uploader.upload("app/assets/images/coffee_banner.jpeg",
                            folder: "lewagon/airdesk/assets/",
                            public_id: "coffee_banner"
                            )

    <% results.each do |result| %>
      <% record = result.searchable %>
      <% if record.is_a?(Office) %>
        <%= render office %>
      <% elsif record.is_a?(User) %>
        <%= render user %>
      <% elsif record.is_a?(Booking) %>
        <%= render booking %>
      <% elsif record.is_a?(Review) %>
        <%= render review %>
      <% end %>
    <% end %>
