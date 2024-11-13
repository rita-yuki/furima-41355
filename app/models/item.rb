class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :product_status_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_up_to_delivery_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: { message: 'を添付してください' }
end
 
