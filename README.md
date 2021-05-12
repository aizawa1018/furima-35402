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

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |
| name               | string              | null: false             |
| name_kana          | string              | null: false             |
| profile            | text                | null: false             |

### Association

* has_many :items
* has_many :buyers
* has_one  :order_history


## items

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user_id            | references          | foreign_key: true       |
| title              | string              | null: false             |
| prose              | string              | null: false             |
| description        | text                | null: false             |
| image              | string              | null: false             |

### Association

* belongs_to :users
* has_many   :buyers
* has_one    :order_history


## order_historys

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user_id            | references          | foreign_key: true       |
| item_id            | references          | foreign_key: true       |
| day                | date                | null: false             |

### Association

* belongs_to :users
* belongs_to :items


## buyers

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user_id            | references          | foreign_key: true       |
| item_id            | references          | foreign_key: true       |
| post_code          | string              | null: false             |
| address            | string              | null: false             |
| prefecture         | string              | null: false             |
| city               | string              | null: false             |
| building_name      | string              |                         |
| phone_number       | string              |                         |


### Association

* belongs_to :users
* belongs_to :items