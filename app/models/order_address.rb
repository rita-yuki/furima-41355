class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :block, :building_name, :telephone_number, :token

  with_options presence: { message: "can't be blank" } do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :block
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
    validates :telephone_number, length: { minimum: 10, message: 'is too short' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      municipality: municipality,
      block: block,
      building_name: building_name,
      telephone_number: telephone_number,
      order_id: order.id
    )
  end
end
