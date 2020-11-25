# Template Name: Fire Up - Bootstrap 4
# Instructions: $ rails new myapp -d <postgresql, mysql, sqlite3> -m my_template.rb
# Instructions: $ rails new myapp -m https://raw.githubusercontent.com/kevin0117/rails-template/master/my_template.rb

require 'fileutils'
require 'tmpdir'

SOURCE_REPO = 'https://github.com/kevin0117/rails-template.git'.freeze

def set_source_path
  if __FILE__ =~ %r{\Ahttps?://}
    tempdir = Dir.mktmpdir('rails-template-')
    source_paths.unshift(tempdir)
    at_exit { remove_dir(tempdir) }
    git clone: "--quiet #{SOURCE_REPO} #{tempdir}"
  else
    source_paths.unshift(File.dirname(__FILE__))
  end
end

def add_gems
  gem 'devise', '~> 4.7', '>= 4.7.1'
  gem 'friendly_id', '~> 5.3'
  gem 'sidekiq', '~> 6.0', '>= 6.0.6'
  gem 'foreman', '~> 0.87.1'
  gem 'hirb-unicode', '~> 0.0.5'
  gem 'rspec-rails', '~> 4.0'
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'faker', '~> 2.11'
  gem 'pry-rails', '~> 0.3.9'
  gem 'bootstrap', '~> 4.5', '>= 4.5.3'
  gem 'simple_form', '~> 5.0', '>= 5.0.3'
  gem 'devise-bootstrap-views', '~> 1.1'
end

def add_users
  # Install Devise
  generate 'devise:install'

  route "root to: 'pages#index'"

  # Create Devise User
  generate :devise, 'User', 'username', 'name', 'admin:boolean'

  # set admin boolean to false by default
  in_root do
    migration = Dir.glob('db/migrate/*').max_by { |f| File.mtime(f) }
    gsub_file migration, /:admin/, ':admin, default: false'
  end
end

def copy_templates
  directory 'app', force: true
  directory 'config', force: true
end

def remove_app_css
  remove_file 'app/assets/stylesheets/application.css'
end

def add_sidekiq
  environment 'config.active_job.queue_adapter = :sidekiq'

  insert_into_file 'config/routes.rb',
                   "require 'sidekiq/web'\n\n",
                   before: 'Rails.application.routes.draw do'

  content = <<-RUBY
      authenticate :user, lambda { |u| u.admin? } do
        mount Sidekiq::Web => '/sidekiq'
      end
  RUBY
  insert_into_file 'config/routes.rb', "#{content}\n\n", after: "Rails.application.routes.draw do\n"
end

def add_foreman
  copy_file 'Procfile'
end

def add_friendly_id
  generate 'friendly_id'
end

def add_rspec
  generate 'rspec:install'
end

def add_simple_form
  generate 'simple_form:install --bootstrap'
end

def add_devise_bootstrap_views
  generate 'devise:views:bootstrap_templates'
end

# Main setup
set_source_path
run 'bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java'
add_gems

after_bundle do
  add_users
  add_sidekiq
  add_foreman
  add_simple_form
  add_devise_bootstrap_views
  remove_app_css
  copy_templates
  add_friendly_id
  add_rspec

  run 'yarn add bootstrap jquery popper.js'
  rails_command 'db:create'
  rails_command 'db:migrate'

  git :init
  git add: '.'
  git commit: %( -m "Initial commit" )

  say
  say 'Your fire up app successfully created!', :green
  say
  say 'Switch to your app by running:', :green
  say "$ cd #{app_name}", :red
  say
  say 'Please run:', :green
  say '$ rails server'
end
