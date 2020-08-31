# テーブル設計
## users テーブル
| Column     | Type   | Options     |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name_kanji | string | null: false |
| name_kana  | string | null: false |
| birthday   | string | null: false |

### Association
* has_many: items

## items テーブル
| Column        | Type       | Options                        |
| name          | string     | null: false                    |
| info          | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| shipping_area | string     | null: false                    |
| shipping_days | string     | null: false                    |
| price         | integer    | null: false                    |
| users_id      | references | null: false, foreign_key: true |

### Association
* belings_to: user
* has_one: purchase
* has_one_attached: image

## purchases テーブル
| Column        | Type       | Options                        |
| card_num      | integer    | null: false                    |
| expiration    | string     | null: false                    |
| security_code | integer    | null: false                    |
| item_id       | references | null: false, foreign_key: true |

### Association
* belongs_to: item
* has_one: address

## addresses
| Column      | Type       | Options                        |
| postal_code | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city_name   | string     | null: false                    |
| street_num  | string     | null: false                    |
| building    | string     |                                |
| phone_num   | integer    | null: false                    |
| purchase_id | references | null: false, foreign_key: true |

### Association
* belongs_to: purchase