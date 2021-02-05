# README
![myfavoriteroutes2](https://user-images.githubusercontent.com/74900438/106980114-f227f580-67a2-11eb-8e62-e96f161ae23c.jpg)

# アプリ概要

# 開発環
* Ruby 2.6.5
* Ruby on Rails 6.0.0
* MySQL 5.5.8
* GitHub
* Visual Studio Code
* JavaScript
* AWS S3
* Heroku

# 制作背景

# 実装機能
* ログイン機能
* 投稿機能
* 画像ファイルのアップロード機能
* プルダウン選択機能
* コメント機能
* 投稿検索機能
* 投稿の詳細、編集、削除機能
* 単体テスト、結合テスト

# 使用したGem
gem 'devise'
gem 'mini_magick'
gem 'image_processing', '~> 1.2'
gem 'active_hash'
gem "aws-sdk-s3"
gem "pry-rails"
gem 'rspec-rails', '~> 4.0.0'
gem 'factory_bot_rails'
gem 'faker'

# My_Favorite_Routesのテーブル設計

## users テーブル

| Column     | Type   | Option      |
| ---------- | -----  | ----------- | 
| email      | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |

### Association

- has_many :routes
- has_many :comments

## routes テーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |      
| text        | text       | null: false                    |
| city_id     | integer    | null: false                    |
| category_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to_active_hash :city
- belongs_to_active_hash :category

## comments テーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| route     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :route