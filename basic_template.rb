# Template Name: Fire Up - Bootstrap 4
# Instructions: $ rails new myapp -d <postgresql, mysql, sqlite3> -m my_template.rb
# Instructions: $ rails new myapp -m https://raw.githubusercontent.com/kevin0117/rails-template/master/basic_template.rb

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
  gem 'hirb-unicode', '~> 0.0.5'
  gem 'rspec-rails', '~> 4.0'
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'faker', '~> 2.11'
  gem 'pry-rails', '~> 0.3.9'
  gem 'bootstrap', '~> 4.5', '>= 4.5.3'
  gem 'simple_form', '~> 5.0', '>= 5.0.3'
end

def copy_templates
  directory 'app/assets/stylesheets', force: true
  directory 'config', force: true
end

def remove_app_css
  remove_file 'app/assets/stylesheets/application.css'
end

def add_rspec
  generate 'rspec:install'
end

def add_simple_form
  generate 'simple_form:install --bootstrap'
end

# Main setup
set_source_path
run 'bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java'
add_gems

after_bundle do
  add_simple_form
  remove_app_css
  copy_templates
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
