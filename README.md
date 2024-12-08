# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| name               | string  | null: false               |
| kana_family_name   | string  | null: false               | 
| kana_name          | string  | null: false               |
| birthday           | date    | null: false               |


### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                 | Type       | Options                         |
| ---------------------- | ---------- | ------------------------------- |
| user                   | references | null: false , foreign_key: true | 
| title                  | string     | null: false                     |
| description            | text       | null: false                     |
| category_id            | integer    | null: false                     |
| product_status_id      | integer    | null: false                     |
| shipping_fee_id        | integer    | null: false                     |
| prefecture_id          | integer    | null: false                     |
| days_up_to_delivery_id | integer    | null: false                     |
| price                  | integer    | null: false                     |

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |   
| block            | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order



