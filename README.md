# テーブル設計

## organizations テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |


### Association

- has_many :users
- has_many :items

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| email              | string     | null: false                    |
| password           | string     | null: false                    |
| admin              | boolean    | null: false                    |
| organization       | references | null: false, foreign_key: true |


### Association

- has_many :orders
- has_many :consumptions
- belongs_to :organization

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| info                   | text       |                                |
| category_id            | integer    | null: false                    |
| url                    | text       | null: false                    |
| stock_quantity         | integer    | null: false                    |
| standard_inventory     | integer    | null: false                    |
| ordering_unit          | integer    | null: false                    |
| price                  | integer    | null: false                    |
| place                  | string     | null: false                    |
| organization           | references | null: false, foreign_key: true |

### Association

- belongs_to :organization
- has_many :consumptions
- has_many :orders

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| quantity            | integer    | null: false                    |
| done                | boolean    | null: false                    |
| price               | integer    | null: false                    |
| comment             | text       |                                |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## consumptions テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| quantity            | integer    | null: false                    |
| price               | integer    | null: false                    |
| comment             | text       | null: false                    |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item