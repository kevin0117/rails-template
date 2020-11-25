# My Rails Application Templates

### Bootstrip 基本版

#### 安裝說明：
在終端機內輸入：$ rails new myapp -m https://raw.githubusercontent.com/kevin0117/rails-template/master/my_template.rb
如要選擇資料庫則需要加入： -d <postgresql, mysql, sqlite3>

例如：$ rails new myapp -m https://raw.githubusercontent.com/kevin0117/rails-template/master/my_template.rb -d postgresql

安裝 gem
  - gem 'devise', '~> 4.7', '>= 4.7.1'
  - gem 'friendly_id', '~> 5.3'
  - gem 'sidekiq', '~> 6.0', '>= 6.0.6'
  - gem 'foreman', '~> 0.87.1'
  - gem 'hirb-unicode', '~> 0.0.5'
  - gem 'rspec-rails', '~> 4.0'
  - gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  - gem 'faker', '~> 2.11'
  - gem 'pry-rails', '~> 0.3.9'
  - gem 'bootstrap', '~> 4.5', '>= 4.5.3'
  - gem 'simple_form', '~> 5.0', '>= 5.0.3'
  - gem 'devise-bootstrap-views', '~> 1.1'

成功安裝後會建立:
- PagesController 及 index.html.erb
- 基本的 Devise 使用者驗證機制頁面
