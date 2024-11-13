class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates  :product_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :days_up_to_delivery_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: { message: 'を添付してください' }
end
 
