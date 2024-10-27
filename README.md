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
| full_name          | string  | null: false               |
| kana_full_name     | string  | null: false               | 

### Association

- has_many :items
- has_many :purchases_as_buyer, class_name: 'Purchase', foreign_key: 'buyer_id' 
- has_many :purchases_as_seller, class_name: 'Purchase', foreign_key: 'seller_id' 
- has_many :comments
- has_many :messages


## items テーブル

| Column                     | Type     | Options                         |
| -------------------------- | -------- | ------------------------------- |
| user_id                    | integer  | null: false , foreign_key: true |
| image                      | text     | null: false                     |
| title                      | string   | null: false                     |
| description                | text     | null: false                     |
| category                   | text     | null: false                     |
| product_status             | string   | null: false                     |
| shipping_fee               | string   | null: false                     |
| regional_original_delivery | string   | null: false                     |
| days_up_to_delivery        | string   | null: false                     |
| price                      | integer  | null: false                     |
| stock                      | boolean  | null: false                     |

### Association
- belongs_to :user
- has_many :comments
- has_one :purchase


## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_id         | integer    | null: false, foreign_key: true |
| buyer_id        | integer    | null: false, foreign_key: true |
| seller_id       | integer    | null: false, foreign_key: true |
| price           | integer    | null: false                    |
| purchased_at    | TIMESTAMP  | null: false                    |
| shipping_address| integer    | null: false                    |

### Association

- belongs_to :items
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
- has_many :messages


## comments テーブル

| Column     | Type      | Options                        |
| ---------- | --------- | ------------------------------ |
| user_id    | integer   | null: false, foreign_key: true |
| item_id    | integer   | null: false, foreign_key: true |
| content    | text      | null:false                     |                           |
| created_at | TIMESTAMP | null: false                    |

### Association

- belongs_to :user
- belongs_to :items

## messages テーブル

| Column     | Type      | Options                        |
| ---------- | --------- | ------------------------------ |
| item_id    | integer   | null: false, foreign_key: true |
| buyer_id   | integer   | null: false, foreign_key: true |
| seller_id  | text      | null: false, foreign_key: true |   
| content    | text      | null: false                    |
| created_at | TIMESTAMP | null: false                    |

### Association

- belongs_to :item
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'


