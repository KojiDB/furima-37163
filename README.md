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
| birth_day          | date       | null: false                    |

- has_many :items
- has_many :comments
- has_many :buyers

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| introduction       | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false,                   |
| item_conditions_id | integer    | null: false,                   |
| area_id            | integer    | null: false,                   |
| postage_fee_id     | integer    | null: false,                   |
| postage_day_id     | integer    | null: false,                   |
| user               | references | null: false, foreign_key: true |

- has_many :comments
- has_one :buyer
- belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_number   | string     | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| street_number | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| buyer         | references | null: false, foreign_key: true |

- belongs_to :buyer

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| comment | text       | null: false                    |

- belongs_to :user
- belongs_to :item

## buyers テーブル

| Column     | Type       | Options                     |
| ---------- | ---------- | --------------------------- |
| user       | references | null:false,foreign_key:true |
| item       | references | null:false,foreign_key:true |

- belongs_to :user
- belongs_to :item
- has_one :address