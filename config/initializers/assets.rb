# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )


layout_css = %w( css/bootstrap.min.css css/content.css css/navbar.css css/sidebar.css )
layout_Javascript = %w( js/bootstrap.min.js js/jquery-1.11.3.min.js js/navbar/navbar.js )
custom_css = %w(  )

sumary_static_file = layout_css + layout_Javascript + custom_css

Rails.application.config.assets.precompile += sumary_static_file
