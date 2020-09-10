class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :postal_code, :prefecture_id, :city, :street, :building, :phone_num

  validates :token, presence: true

  def save
    Order.create(token: token, item_id: item_id, user_id: current_user.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_num: phone_num)
  end
end