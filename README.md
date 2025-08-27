# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items

## items テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| product         | string | null: false |
| image           | string | null: false |
| description     | text   | null: false |
| category        | string | null: false |
| status          | string | null: false |
| price           | string | null: false |
| seller          | string | null: false |
| shipping_fee    | string | null: false |
| shipping_source | string | null: false |
| delivery_time   | string | null: false |

### Association

- has_many :orders
- belongs_to :users

## order テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |
| product_id | text       | null: false |

### Association

- belongs_to :users
- belongs_to :orders
- has_one :purchaser

## purchaser テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| user_id           | references | null: false, foreign_key: true |
| order_id          | references | null: false, foreign_key: true |
| postcode          | string     | null: false |
| prefecture        | string     | null: false |
| municipalities    | string     | null: false |
| street_address    | string     | null: false |
| building_name     | string     | null: false |
| telephone_number  | string     | null: false |

### Association

- belongs_to :orders
