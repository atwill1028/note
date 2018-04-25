# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|credit_number|integer||
|profile|string||
|image|string||

### Association
- has_many :contributes
- has_many :comments
- has_many :follows


## contributesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string||
|content|string||
|user|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|string||
|user|reference|null: false, foreign_key: true|
|contribute|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :contribute


## followsテーブル

|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|follow_id|integer|null: false|

### Association
- belongs_to :user

## contribute_likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|contribute|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :contribute

## comment_likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|comment|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :comment

