class Item < ApplicationRecord
  belongs_to       :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days

  with_options presence: true do
    validates :image
    validates :name
    validates :info

    with_options numericality: {greater_than: 1, message: "リストから選択してください"} do
      validates :category_id
      validates :status_id
      validates :delivery_fee
      validates :shipping_area
      validates :shipping_days
    end

    validates :price,        numericality: { only_integer: true, greater_than: 299, less_than: 10000000, message: "指定内の金額を入力してください" }
  end
end
