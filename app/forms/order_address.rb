class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :prefecture_id, :city, :street, :building, :phone_num

  validates :token, presence: true

  def save
    order = Order.create(token: token, item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_num: phone_num, order_id: order.id)
  end
end