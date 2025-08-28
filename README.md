# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| product            | string  | null: false |
| description        | text    | null: false |
| category_id        | integer | null: false |
| status_id          | integer | null: false |
| price              | integer | null: false |
| seller_id          | integer | null: false, foreign_key: true |
| shipping_fee_id    | integer | null: false, foreign_key: true |
| prefecture_id      | integer | null: false, foreign_key: true |
| delivery_time_id   | integer | null: false, foreign_key: true |

### Association

- has_many :orders
- belongs_to :user

## order テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order
- has_one :purchaser

## purchasers テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| order             | references | null: false, foreign_key: true |
| postcode          | string     | null: false |
| prefecture_id     | string     | null: false |
| municipality      | string     | null: false |
| street_address    | string     | null: false |
| building_name     | string     |             |
| telephone_number  | string     | null: false |

### Association

- belongs_to :order
