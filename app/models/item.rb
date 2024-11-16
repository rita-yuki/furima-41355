class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, :description, presence: true
  validates :category_id, :product_status_id, :shipping_fee_id, :prefecture_id, :days_up_to_delivery_id, 
            presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
            format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  validates :image, presence: { message: 'を添付してください' }
end