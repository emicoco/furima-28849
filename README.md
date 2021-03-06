# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|

### Association
- has_many :items
- has_many :likes
- has_many :comments
- has_many :purchase_managements

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|name|string|null: false|
|price|integer|null: false|
|category|integer|null: false|
|description|text|null: false|
|status|integer|null: false|
|shipping_origin_area|integer|null: false|
|shipping_days|integer|null: false|
|postage|integer|null: false|
|shipping_method|integer|null: false|

### Association
- has_many :likes
- has_many :comments
- belongs_to :user
- has_one :purchase_management

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|item|references|null: false,foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|item|references|null: false,foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|purchase_management|references|null: false,foreign_key: true|
|post_number|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|tel|string|null: false|

### Association
-belongs_to :purchase_management

##purchase_managementテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|item|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :buyer