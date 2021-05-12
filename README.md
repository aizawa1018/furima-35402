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

## users

| Column                 | Type                | Options                 |
|----------------------- |---------------------|-------------------------|
| email                  | string              |null: false、unique: true|
| encrypted_password     | string              | null: false             |
| nickname               | string              | null: false             |
| first_name             | string              | null: false             |
| last_name              | string              | null: false             |
| first_name_kana        | string              | null: false             |
| last_name_kana         | string              | null: false             |
| birthday               | date                | null: false             |

### Association

* has_many :items
* has_many :buyers
* has_many  :order_history


## items

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| title              | string              | null: false             |
| prise              | string              | null: false             |
| description        | text                | null: false             |
| days               | date                | null: false             |
| prefecture         | string              | null: false             |


### Association

* belongs_to :user
* has_many   :buyers
* belongs_to :order_history


## order_historys

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| item               | references          | foreign_key: true       |

### Association

* belongs_to :user
* belongs_to :item
* belongs_to :buyer


## buyers

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| item               | references          | foreign_key: true       |
| post_code          | string              | null: false             |
| address            | string              | null: false             |
| prefecture         | string              | null: false             |
| city               | string              | null: false             |
| building_name      | string              |                         |
| phone_number       | string              | null: false             |


### Association

* belongs_to :user
* has_many :item