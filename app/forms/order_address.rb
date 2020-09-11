class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :prefecture_id, :city, :street, :building, :phone_num

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with:/\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { greater_than: 1, message: 'is invalid. Choose from lists' }
    validates :city
    validates :street
    validates :phone_num, format: { with: /\A\d+\z/, message: 'is invalid. Input half-width characters'},
                          length: { maximum: 11, message: 'is invalid. Input within 11 characters' }
  end

  def save
    order = Order.create(token: token, item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_num: phone_num, order_id: order.id)
  end
end