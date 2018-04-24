# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|note_id|string|null: false, unique: true|
|mail|string|null: false, unique: true|
|pass|string|null: false, unique: true|
|credit_number|integer||
|profile|integer||
|img|integer||

### Association
- has_many :contributes
- has_many :comments
- has_many :follows


## contributesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string||
|content|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|string||
|user_id|integer|null: false,foreign_key: true|
|contribute_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :contribute


## followsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key:true|
|follow_id|integer|null: false|

### Association
- belongs_to :user

## contribute_likeテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key:true|
|contribute|integer|null: false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :contribute

## comment_likeテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key:true|
|comment_id|integer|null: false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :comment

