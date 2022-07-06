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
## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| company_name       | string | null: false               |
| phone_number       | string | null: false               |


### Association

--has_one :shopping_cart
--has_many :rentals


## items テーブル

| Column             | Type       | Options                       |
| ------------------ | -----------| ----------------------------- |
| name               | string     | null: false                   |
| price              | integer    | null: false                   |


### Association

--has_many :shopping_cart_items
--has_many :rental_details
--has_many :stocks


## rentals テーブル

| Column             | Type       | Options                       |
| ------------------ | -----------| ----------------------------- |
| item               | references | null: false, foreign_key: true|
| user               | references | null: false, foreign_key: true|
|
### Association

--belongs_to :user
--has_many :rental_details
--has_many :items, through: :rental_details
--has_many :rental_days

##  rental_daysテーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| -------------------------------|
| rental_day         | integer    | null: false                    |
| rental_id          | integer    | null: false, foreign_key: true |

### Association

--belongs_to :rental


## stocks テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| stock_num | integer    | null: false                    |
| item      | integer    | null: false, foreign_key: true |

### Association

--belongs_to :item

## users_admin テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| company_name       | string  | null: false               |
| phone_number       | string  | null: false               |
| admin              | boolean | default: false            |

# shopping_cart_items テーブル
| Column               | Type       | Options                        |
| ---------------------| ---------- | ------------------------------ |
| item_id              | integer    | null: false, foreign_key: true |
| shopping_cart_id     | integer    | null: false, foreign_key: true |
| quantity             | integer    | null: false                    |

### Association
--belongs_to :shopping_cart
--belongs_to :item

# rental_details テーブル
| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| item_id     | integer    | null: false, foreign_key: true |
| rental_id   | integer    | null: false, foreign_key: true |
| rental_count| integer    | null: false                    |

### Association
--belongs_to :rental
--belongs_to :item

# shopping_carts テーブル
| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| user_id     | integer    | null: false, foreign_key: true |
### Association
--has_many :cart_items
--belongs_to :user