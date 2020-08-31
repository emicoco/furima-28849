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
- has_one :buyer
- has_one :purchase_management

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|name|string|null: false|
|price|integer|null: false|
|category|string|null: false|
|description|string|null: false|
|status|integer|null: false|
|shipping_origin_area|string|null: false|
|shipping_days|datetime|null: false|
|postage|string|null: false|
|shipping_method|integer|null: false|

### Association
- has_many :likes
- has_many :comments
- belongs_to :user


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## buyerテーブル
|Column|Type|Options|
|------|----|-------|
|post_number|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|

### Association
- belongs_to :user


##purchase_managementテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|item|references|null: false,foreign_key: true|

### Association
- belongs_to :user