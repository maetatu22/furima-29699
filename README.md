# テーブル設計

## users テーブル

| Column            | Type               | Options                     |
| ----------------- | ------------------ |-----------------------------|
| nickname          | string             | null: false                 |
| email             | string             | null: false, uniqueness:true|
| encrypted_password| string             | null: false                 |
| last_name         | string             | null: false                 |
| first_name        | string             | null: false                 |
| last_name_kana    | string             | null: false                 |
| first_name_kana   | string             | null: false                 |
| birthday          | date               | null: false                 |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |  
| name            | string     | null:false                    |
| text            | text       | null:false                    |
| category_id     | integer    | null:false                    |
| status_id       | integer    | null:false                    |
| shipping_cost_id| integer    | null:false                    |
| area_id         | integer    | null:false                    |
| shipping_time_id| integer    | null:false                    | 
| price           | integer    | null:false                    |
| user            | references | null:false, foreign_key: true |

### Association

- belongs_to             :user
- has_one                :buyer
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping_cost
- belongs_to_active_hash :area
- belongs_to_active_hash :shipping_time

## buyers テーブル

| Column | Type      | Options                       |
| ------ | --------- | ----------------------------- |
| user   | references| null:false, foreign_key: true |
| item   | references| null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column       | Type      | Options                       |
| ------------ | --------- | ----------------------------- |
| postal_code  | string    | null:false                    |
| area_id      | integer   | null:false                    |      
| municipality | string    | null:false                    |
| block_number | string    | null:false                    |
| building_name| string    |                               |
| phone_number | string    | null:false                    |
| buyer        | references| null:false,foreign_key:true   | 

### Association

- belongs_to             :buyer
- belongs_to_active_hash :area

## category モデル(acrive_hash)

## status モデル(acrive_hash)

## shipping_cost モデル(acrive_hash)

## area モデル(acrive_hash)

## shipping_time モデル(acrive_hash)