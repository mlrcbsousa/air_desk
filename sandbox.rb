# use this for testing purposes for ruby code to run in `irb` and other stuff

Cloudinary::Uploader.upload("app/assets/images/coffee_banner.jpeg",
                            folder: "lewagon/airdesk/assets/",
                            public_id: "coffee_banner"
                            )
