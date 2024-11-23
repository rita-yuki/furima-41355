class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def sold_out?
    # purchase.present?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :days_up_to_delivery

  validates :title, :description, presence: true
  validates :category_id, :product_status_id, :shipping_fee_id, :prefecture_id, :days_up_to_delivery_id,
            numericality: { other_than: 0, message: "can't be blank" }
  validates :price, presence: true
  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }
  validates :image, presence: { message: 'を添付してください' }
end
