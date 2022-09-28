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

## usersテーブル(ユーザー情報)

|Column|Type|Options|
| email               | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string         | null: false      |
| first_name           | string            | null: false               |
| last_name           | string            | null: false               |
| first_name_kana           | string            | null: false               |
| last_name_kana           | string            | null: false               |
| birth_date  | date              | null: false               |


### Association

has_many :items
has_many :orders



## itemsテーブル（商品情報）

|Column         |Type|Options|
| user          | references | null: false, foreign_key: true |
| title          | string         | null: false               |
| category_id       | integer    | null:false             |
| condition_id     | integer    | null:false             |
| delivery_charge_id    | integer       | null:false   |
| scheduled_delivery_id      | integer       | null:false   |
| product_price_id     |  integer       | null:false   |
|  prefecture_id    |  integer  | null: false  |
| products    | text  | null:false |


### アソシエーション

belongs_to :user

has_one :order


## ordersテーブル（商品購入情報）

|Column         |Type|Options|
| user          | references | null: false, foreign_key: true |
| item   | references    | null: false, foreign_key: true  |


###  アソシエーション


belongs_to :user
has_one :address
belongs_to :item


## addressesテーブル（発送先情報）

|Column         |Type|Options|
| order       | references | null: false, foreign_key: true |
|  prefecture_id    | integer  | null:false   |　##都道府県名
| zipcode  |  string | null:false  | 　##郵便番号
| addr_city |  string | null:false | ##市区町村名
| addr_num  | string	|null:false | ##丁目、番地
|  building |    string   |     | ##建物名
| phone_number  | string | null:false  |　　##電話番号


###  アソシエーション

belongs_to :order

