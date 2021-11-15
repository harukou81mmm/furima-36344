# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |
| birth_day          | date   | null: false |


### Association

- has_many :item
- has_one :credit_card
- has_one :destination



## items テーブル

| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| image               | string    | null: false |
| name                | string    | null: false |
| item_condition      | string    | null: false |
| price               | integer   | null: false |
| category_id         | integer   | null: false |
| status_id           | integer   | null: false |
| shopping_charges_id | integer   | null: false |
| shopping_area_id    | integer   | null: false |
| days_id             | integer   | null: false |
| prefecture_id       | integer   | null: false |
| user_id             | integer   | null: false, foreign_key: true | 



### Association

- belongs_to :user
- belongs_to :category
- belongs_to :brand




## brands テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| name               | string    |

### Association

- has_many :item



## categories テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| name               | string    | null: false |
| ancestry           | string    |

### Association

- has_many :item


## credit_cards テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user_id            | references | null: false, foreign_key: true |
| customer_id        | string     | null: false |
| card_id            | string     | null: false | 

### Association

- belongs_to :user



## destinations テーブル

| Column           | Type        | Options     |
| ---------------- | ----------- | ----------- |
| family_name      | string      | null: false |
| first_name       | string      | null: false |
| family_name_kana | string      | null: false |
| first_name_kana  | string      | null: false |
| post_code        | string      | null: false |
| prefecture       | string      | null: false |
| city             | string      | null: false |
| address          | string      | null: false |
| building_name    | string      | null: false |
| phone_number     | string      | null: false |
| user_id          | references  | null: false, foreign_key: true |

### Association

- belongs_to :user

