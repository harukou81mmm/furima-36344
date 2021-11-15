# テーブル設計

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| first_name         | string | null: false  |
| family_name        | string | null: false  |
| first_name_kana    | string | null: false  |
| family_name_kana   | string | null: false  |
| birth_day          | date   | null: false  |


### Association

- has_many :items
- has_one :destination



## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| item_condition      | text       | null: false |
| price               | integer    | null: false |
| category_id         | integer    | null: false |
| status_id           | integer    | null: false |
| shopping_charges_id | integer    | null: false |
| shopping_area_id    | integer    | null: false |
| days_id             | integer    | null: false |
| seller_id           | references | null: false, foreign_key: true | 
| buyer_id            | references | null: false, foreign_key: true | 


### Association

- belongs_to :user



## credit_cards テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user_id            | references | null: false, foreign_key: true |
| customer_id        | string     | null: false |

### Association

- belongs_to :user



## destinations テーブル

| Column           | Type        | Options     |
| ---------------- | ----------- | ----------- |
| post_code        | string      | null: false |
| prefecture_id    | integer     | null: false |
| city             | string      | null: false |
| address          | string      | null: false |
| building_name    | string      |
| phone_number     | string      | null: false |

### Association

- belongs_to :user

