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
* has_many  :order_historys


## items

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| category_id        | integer             | null: false             |
| fare_id            | integer             | null: false             |
| condition_id       | integer             | null: false             |
| days_id            | integer             | null: false             |
| prefecture_id      | integer             | null: false             |
| title              | string              | null: false             |
| description        | string              | null: false             |
| price              | integer             | null: false             |


### Association

* belongs_to :user
* has_one    :order_history


## order_historys

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| item               | references          | foreign_key: true       |

### Association

* belongs_to :user
* belongs_to :item
* has_one    :buyer


## buyers

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| order_history      | references          | foreign_key: true       |
| post_code          | string              | null: false             |
| address            | string              | null: false             |
| prefecture_id      | integer             | null: false             |
| city               | string              | null: false             |
| building_name      | string              |                         |
| phone_number       | string              | null: false             |


### Association
belongs_to :order_history



  validate :images_presence

def images_presence
    if images.attached?
      if images.length > 1
        errors.add(:image, '1枚まで投稿できます')
      end
    else
      errors.add(:image, '画像がありません')
    end
  end



