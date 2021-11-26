# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_read    | string     | null: false                    |
| last_name_read     | string     | null: false                    |
| phone_number       | integer    | null: false                    |
| birth_y            | integer    | null: false                    |
| birth_m            | integer    | null: false                    |
| birth_d            | integer    | null: false                    |
| address            | references | null: false, foreign_key: true |

- has_many :items
- has_many :comments
- has_one :address
- has_one :credit_card

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| introduction    | text       | null: false                    |
| price           | integer    | null: false                    |
| category        | references | null: false, foreign_key: true |
| item_conditions | references | null: false, foreign_key: true |
| area            | references | null: false, foreign_key: true |
| postage_fee     | references | null: false, foreign_key: true |
| postage_day     | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

- has_many :item_images
- has_many :comments
- has_one :category
- has_one :item_condition
- has_one :area
- has_one :postage_fee
- has_one :postage_day
- belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_number   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| street_number | string     | null: false                    |
| building_name | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

- belongs_to :user

## credit_cards テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false                    |
| credit_id | string     | null: false, foreign_key: true |

- belongs_to :user

## item_images テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_image | string     | null: false                    |
| item_id    | references | null: false, foreign_key: true |

- belongs_to :item

## categories テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

- belongs_to :item

## item_conditions テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ---------   |
| item_condition | string | null: false |

- belongs_to :item

## areas テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| area   | string | null: false |

- belongs_to :item

## postage_fees テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| postage_fee | string | null: false |

- belongs_to :item

## postage_days テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| postage_day | string | null: false |

- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
| comment | text       | null: false                    |

- belongs_to :user
- belongs_to :item