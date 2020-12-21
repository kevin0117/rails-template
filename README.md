# My Rails Application Templates

### Bootstrap Devise Version

#### 安裝說明：
在終端機內輸入：rails new myapp -m https://raw.githubusercontent.com/kevin0117/rails-template/master/my_template.rb

如要選擇其他資料庫則需要加入： -d <postgresql, mysql>

例如：rails new myapp -m https://raw.githubusercontent.com/kevin0117/rails-template/master/my_template.rb -d postgresql

##### 安裝 gem
  - devise, '~> 4.7', '>= 4.7.1'
  - friendly_id, '~> 5.3'
  - sidekiq, '~> 6.0', '>= 6.0.6'
  - foreman, '~> 0.87.1'
  - hirb-unicode, '~> 0.0.5'
  - rspec-rails, '~> 4.0'
  - factory_bot_rails, '~> 5.1', '>= 5.1.1'
  - faker, '~> 2.11'
  - pry-rails, '~> 0.3.9'
  - bootstrap, '~> 4.5', '>= 4.5.3'
  - simple_form, '~> 5.0', '>= 5.0.3'
  - devise-bootstrap-views, '~> 1.1'

##### 成功安裝後會建立:
- PagesController 及 index.html.erb
- 基本的 Devise 使用者驗證機制頁面



### Bootstrap Basic Version

#### 安裝說明：
在終端機內輸入：rails new myapp -m https://raw.githubusercontent.com/kevin0117/rails-template/master/basic_template.rb

如要選擇其他資料庫則需要加入： -d <postgresql, mysql>

例如：rails new myapp -m https://raw.githubusercontent.com/kevin0117/rails-template/master/basic_template.rb -d postgresql

##### 安裝 gem
  - hirb-unicode, '~> 0.0.5'
  - rspec-rails, '~> 4.0'
  - factory_bot_rails, '~> 5.1', '>= 5.1.1'
  - faker, '~> 2.11'
  - pry-rails, '~> 0.3.9'
  - bootstrap, '~> 4.5', '>= 4.5.3'
  - simple_form, '~> 5.0', '>= 5.0.3'
