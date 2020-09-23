# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| first_name         | string   | null: false |
| last_name          | string   | null: false |
| first_name_kana    | string   | null: false |
| last_name_ kana    | string   | null: false |
| birth_date         | date     | null: false |

### Association

has_many: items
has_many: purchasers

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | -------    | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| product_name     | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| delivery_area_id | integer    | null: false                    |
| days_id          | integer    | null: false                    |
| price            | integer    | null: false                    |

### Association

belongs_to: user
has_one: purchaser

## purchasers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

belongs_to: user
belongs_to: item
has_one: address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association
belongs_to: purchaser

## ER図

![furima-app-ER](https://user-images.githubusercontent.com/62535314/93979955-f259c280-fdb8-11ea-8884-bbc08133e71d.png)
