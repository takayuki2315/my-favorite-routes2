# README
## My Favorite Routes
![myfavoriteroutesv](https://user-images.githubusercontent.com/74900438/107152322-a47dd980-69aa-11eb-8ff5-a9af0b75a45e.jpg)


## URL
### https://my-favorite-routes2.herokuapp.com/
### →ゲストログインボタンからメールアドレス、パスワードを入力せずにログインできます

# アプリ概要
### ユーザー同士でオススメの『ルート』を投稿共有できるアプリケーション


# 制作背景
#### 今の時代Googleマップなどを使用すれば、行きたい場所の経路はすぐに検索できます。一方でユーザー目線のオススメのルートや近道など、ニッチな情報が投稿共有できるアプリケーションがあると面白いと考えました。
* 『お気に入りのオススメルート』
* 『ここは〇〇で行くと近い』
* 『駅や施設内を含めた最短ルート』
* 『地図には載っていない裏道』
* 『お気に入りの散歩道、ジョギングコース』
* 『今まで知らなかった最短経路』
#### など、ユーザー目線の情報が投稿共有できることで普段自身が何気なく通っている道にも新たな発見があるかもしれません。


# 開発環境
* Ruby 2.6.5
* Ruby on Rails 6.0.0
* MySQL 5.5.8
* GitHub
* Visual Studio Code
* JavaScript
* AWS S3
* Heroku


# 実装機能
* ログイン機能
* 投稿機能
* 画像ファイルのアップロード機能
* プルダウン選択機能
* コメント機能
* 投稿検索機能
* 投稿の詳細、編集、削除機能
* 単体テスト、結合テスト

# トップページ〜詳細ページ
![myfavoriteroutes2](https://user-images.githubusercontent.com/74900438/107003023-71cbb980-67cf-11eb-9949-bdb4bcbfe277.gif)



# テスト
* RSpec
  - 単体テスト
  - 結合テスト


# 使用したGem
* gem 'devise'
* gem 'mini_magick'
* gem 'image_processing', '~> 1.2'
* gem 'active_hash'
* gem "aws-sdk-s3"
* gem "pry-rails"
* gem 'rspec-rails', '~> 4.0.0'
* gem 'factory_bot_rails'
* gem 'faker'


# My Favorite Routesのテーブル設計

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