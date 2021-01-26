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

## comments テーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| route     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :route