# テーブル設計

## users テーブル

| Column     | Type     | Options     |
| ---------- | ------   | ----------- |
| nickname   | string   | null: false |
| email      | string   | null: false |
| password   | string   | null: false |
| first_name | string   | null: false |
| last_name  | string   | null: false |
| birth_date | date     | null: false |

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | -------    | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| product_name     | string     | null: false                    |
| description      | string     | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| delivery_area_id | integer    | null: false                    |
| days_id          | integer    | null: false                    |
| price            | integer    | null: false                    |


## purchasers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

## addresses テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| post_code      | string     | null: false |
| prefectures_id | integer    | null: false |
| municipality   | string     | null: false |
| address        | string     | null: false |
| building_name  | string     | null: false |
| phone_number   | string     | null: false |