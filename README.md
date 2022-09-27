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
| first_name           | string            | null: false,unique:true               |
| second_name           | string            | null: false,unique:true               |
| first_subname           | string            | null: false               |
| second_subname           | string            | null: false               |
| date  | string              | null: false,unique:true                |


### Association

has_many :items
has_many :orders



## itemsテーブル（商品情報）

|Column         |Type|Options|
| user          | references | null: false, foreign_key: true |
| item_name          | string         | null: false               |
| item_description          | text             | null: false               |
| item_category       | text    | null:false             |
| item_condition     | text    | null:false             |
| delivery_charge    | integer       | null:false   |
| shipping_address      | string       |  null:false   |
| shipping_days      | datetime       | null:false   |
| selling_price     |  integer       | null:false   |

### アソシエーション

belongs_to :users
belongs_to :orders
belongs_to :addresses

has_one :orders


## ordersテーブル（商品購入情報）

|Column         |Type|Options|
| user          | references | null: false, foreign_key: true |
| card_information    |   integer                | null: false  |
| shipping_address   |  string          | null: false |
| delivery_charge    | integer       | null:false   |
|  prefecture_name    | varchar(255)  | null:false   |

###  アソシエーション


belongs_to :users
belongs_to :addresses

has_one :items


## addressesテーブル（発送先情報）

|Column         |Type|Options|
| user          | references | null: false, foreign_key: true |
| name           | string              | null: false, foreign_key: true    |
| shipping_days      | datetime       | null:false   |
|  prefecture_name    | varchar(255)  | null:false   |　##都道府県名
| zipcode  |  char(7)  | null:false  | 　##郵便番号
| addr_city | varchar(255) | null:false | ##市区町村名
|  addr_town | varchar(255) | null:false | ##町域
| addr_num  | varchar(255)	|null:false | ##丁目、番地



###  アソシエーション


belongs_to :orders
has_many :items
