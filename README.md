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
| nickname           | string         | null: false, unique:true       |
| name           | string            | null: false,unique:true               |



### Association

has_many :nickname
has_many :user
has_one :name


## itemsテーブル（商品情報）

|Column         |Type|Options|
| user          | references | null: false, foreign_key: true |
| nickname           | string              | null: false      |
| item_name          | text             | null: false               |
| item_description          | text             | null: false               |
| item_category       | text    | null:false             |
| item_condition     | text    | null:false             |
| delivery_charge    | integer       | null:false   |
| shipping_address      | string       |  null:false   |
| shipping_days      | datetime       | null:false   |
| selling_price     |  integer       | null:false   |

### アソシエーション

belongs_to :user
has_many :nickname
has_one :item_name


## ordersテーブル（商品購入情報）

|Column         |Type|Options|
| user          | references | null: false, foreign_key: true |
| nickname           | string              | null: false      |
| card_information    |   integer                | null: false  |
| shipping_address   |  string          | null: false |

###  アソシエーション


belongs_to :nickname
belongs_to :user
has_one :item_name


## addressテーブル（発送先情報）

|Column         |Type|Options|
| user          | references | null: false, foreign_key: true |
| nickname           | string              | null: false      |
| shipping_address   |  string          | null: false |
| shipping_days      | datetime       | null:false   |


###  アソシエーション

belongs_to :nickname
belongs_to :user
belongs_to :shipping_address
belongs_to :shipping_days