# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false,unique:true        |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_read    | string     | null: false                    |
| last_name_read     | string     | null: false                    |
| birth_day          | integer    | null: false                    |

- has_many :items
- has_many :comments
- has_one :address
- has_one :buyer

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| introduction       | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | references | null: false,                   |
| item_conditions_id | references | null: false,                   |
| area_id            | references | null: false,                   |
| postage_fee_id     | references | null: false,                   |
| postage_day_id     | references | null: false,                   |
| user               | references | null: false, foreign_key: true |

- has_many :item_images
- has_many :comments
- has_one :buyer
- belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_number   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| street_number | string     | null: false                    |
| building_name | string     |                                |
| user          | references | null: false, foreign_key: true |

- belongs_to :user

## item_images テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |

- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
| comment | text       | null: false                    |

- belongs_to :user
- belongs_to :item

## buyers テーブル

| Column     | Type       | Options                     |
| ---------- | ---------- | --------------------------- |
| user_id    | references | null:false,foreign_key:true |
| item_id    | references | null:false,foreign_key:true |
| address_id | references | null:false,foreign_key:true |

- belongs_to :user
- belongs_to :item
- belongs_to :address