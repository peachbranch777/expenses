# Expenses

## userテーブル

| Colum              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :income

## incomeテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | string     | null: false, unique: true      |
| category_id        | integer    | null: false                    |
| date               | date       | null: false                    |
| memo               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## spendingテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | string     | null: false, unique: true      |
| category_id        | integer    | null: false                    |
| date               | date       | null: false                    |
| memo               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |



### Association
- belongs_to :user






