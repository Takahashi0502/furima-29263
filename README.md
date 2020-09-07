# テーブル設計
## users テーブル
| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name_kanji | string | null: false |
| first_name_kanji  | string | null: false |
| family_name_kana  | string | null: false |
| first_name_kana   | string | null: false |
| birthday          | date   | null: false |

### Association
* has_many: items
* has_many: orders

## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| info             | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
* belongs_to: user
* has_one: order
* has_one_attached: image
* belongs_to_active_hash :category
* belongs_to_active_hash :status
* belongs_to_active_hash :delivery_fee
* belongs_to_active_hash :shipping_area
* belongs_to_active_hash :shipping_days

## order テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
* belongs_to: item
* belongs_to: user
* has_one: address

## addresses
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city_name      | string     | null: false                    |
| street_num     | string     | null: false                    |
| building       | string     |                                |
| phone_num      | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association
* belongs_to: order
* belongs_to_active_hash :prefecture
