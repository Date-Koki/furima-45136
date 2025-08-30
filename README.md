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
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product            | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| status_id          | integer    | null: false |
| price              | integer    | null: false |
| shipping_fee_id    | integer    | null: false |
| prefecture_id      | integer    | null: false |
| delivery_time_id   | integer    | null: false |
| user               | references | null: false, foreign_key |

### Association

- has_one :order
- belongs_to :user

## order テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchaser
- belongs_to :item

## purchasers テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| order             | references | null: false, foreign_key: true |
| postcode          | string     | null: false |
| prefecture_id     | integer    | null: false |
| municipality      | string     | null: false |
| street_address    | string     | null: false |
| building_name     | string     |             |
| telephone_number  | string     | null: false |

### Association

- belongs_to :order
