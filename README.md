# テーブル設計

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true, null: false |
| encrypted_password | string | null: false  |
| first_name         | string | null: false  |
| family_name        | string | null: false  |
| first_name_kana    | string | null: false  |
| family_name_kana   | string | null: false  |
| birth_day          | date   | null: false  |


### Association

- has_many :items
- has_many :orders


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
| day_id              | integer    | null: false |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order



## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination



## destinations テーブル

| Column           | Type        | Options     |
| ---------------- | ----------- | ----------- |
| post_code        | string      | null: false |
| shopping_area_id | integer     | null: false |
| city             | string      | null: false |
| address          | string      | null: false |
| building_name    | string      |
| phone_number     | string      | null: false |
| order            | references  | null: false, foreign_key: true |

### Association

- belongs_to :order

