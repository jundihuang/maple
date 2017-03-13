source 'https://gems.ruby-china.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'

# unicorn-rails is a simple gem that sets the default server for rack (and rails) to unicorn.
# https://github.com/samuelkadolph/unicorn-rails
gem 'unicorn-rails', '~> 2.2.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Inherited Resources speeds up development by making your controllers inherit all restful actions so you just have to focus on what is important.
# http://github.com/josevalim/inherited_resources
# use github to support rails 5
gem 'inherited_resources', github: 'activeadmin/inherited_resources'

# The administration framework for Ruby on Rails applications.
# https://github.com/activeadmin/activeadmin
gem 'activeadmin', '~> 1.0.0.pre5'

# flat skin for activeadmin
# https://github.com/activeadmin-plugins/active_admin_theme
gem 'active_admin_theme'

# Set of addons to help with the activeadmin ui
# https://github.com/platanus/activeadmin_addons
gem 'activeadmin_addons', '~> 0.9.3'

gem 'devise'

# Use will_paginate
gem 'will_paginate', '~> 3.1.0'
gem 'bootstrap-will_paginate', '0.0.10'

# Use acts-as-taggable
gem 'acts-as-taggable-on', '~> 4.0'

# Friendly_id
gem 'friendly_id','~> 5.1.0'
gem 'ruby-pinyin', '~> 0.4.6'
gem 'babosa'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for . assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use Markdown
gem 'redcarpet'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# mina 作为自动化部署工具
# https://github.com/mina-deploy/mina
gem 'mina'

# https://github.com/scarfacedeb/mina-unicorn
gem 'mina-unicorn', :require => false

group :test do
  # minitest 测试时显示红色和绿色
  gem 'minitest-reporters', '1.0.5'
  # 显示调用跟踪
  gem 'mini_backtrace', '0.1.3'
  # 自动测试
  gem 'guard-minitest', '2.3.1'

end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do

end

