# README

# usersテーブル

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

# Association
- has_many :items,likes.comments
- belongs_to :buyer,card,comment,item,like


# itemsテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_name|string|null: false|
|price|integer|null: false|
|category|string|null: false|
|status|integer|null: false|
|shipping_origin_area|string|null: false|
|shipping_days|datetime|null: false|
|postage|string|null: false|
|shipping_method|integer|null: false|

# Association
- has_many :likes,comments
- belongs_to :user


＃likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|

# Association
- belongs_to :item,user


#commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|

# Association
- belongs_to :item,user


#buyerテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|post_number|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|

# Association
- has_one :user


#cardテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|card_number|string|null: false|
|year|integer|null: false|
|month|integer|null: false|
|security_code|integer|null: false|

# Association
- has_one :user