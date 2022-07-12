## アプリケーション名
  「IMS〜ItemsManagementSystem~」

##  アプリケーション概要
  一般ユーザーは什器レンタルの注文ができる、
  管理者は什器の登録とレンタル履歴を確認できます。

## URL
  https://ims-38055.herokuapp.com/

## テスト用アカウント
  一般ユーザー メールアドレス:test@test.com
             password:09876p
  管理者 メールアドレス:eva@test.com
        password:12345q

## 利用方法
  ユーザー側:新規登録し、商品を選び、数量入力しカートに入れる。カート画面より注文画面へ遷移。
            注文画面にてレンタル日数入力し注文確定。
  管理者：ログイン後、ダッシュボード画面に遷移。商品一覧、商品登録、ユーザー一覧、注文履歴の確認ができる。        

## ユーザーストーリー
  備品管理の自動化による業務生産性向上を図る

## 用件定義
  ruby:2.6.5
  rails:6.0.5
  gem 'devise'
  gem 'pry-rails'
  gem 'rails-i18n'
  gem 'acts_as_shopping_cart', '~> 0.4.1'
  gem 'mini_magick'
  gem 'image_processing', '~> 1.2



## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| company_name       | string | null: false               |
| phone_number       | string | null: false               |


### Association

--has_one :shopping_cart  
--has_many :orders


## items テーブル

| Column             | Type       | Options                       |
| ------------------ | -----------| ----------------------------- |
| name               | string     | null: false                   |
| price              | integer    | null: false                   |


### Association

--has_many :shopping_cart_items 
--has_many :rental_details  
--has_many :stocks


## orders テーブル

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
| order_id           | integer    | null: false, foreign_key: true |

### Association

--belongs_to :order  


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
| order_id   | integer    | null: false, foreign_key: true |
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