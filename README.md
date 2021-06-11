## テーブル設計

## users テーブル

| Column             | Type        | Options                  |
| ------------------ | ----------- | ------------------------ |
| nickname           | string      | null: false              |
| email              | string      | null: false, unique:true |
| encrypted_password | string      | null: false              |
| first_name         | string      | null: false              |
| last_name          | string      | null: false              |
| first_name_kana    | string      | null: false              |
| last_name_kana     | string      | null: false              |
| birth_date         | date        | null: false              |
| profile            | text        |                          |

### Association

- has_many :noodles
- has_many :comments

## noodle テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| store_name      | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| price           | integer    | null: false                    |
| description     | text       | null: false                    |
| menu            | text       | null: false                    |
| genre           | text       | null: false                    |
| star_id         | integer    | null: false                    |
| eat_day         | date       |                     |
| address         | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments


## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| home_number     | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| noodle          | references | null: false, foreign_key: true |

### Association

- belongs_to :noodle

## comment テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | text       | null: false                    |
| noodle        | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :noodle
