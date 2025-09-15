class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :order
  belongs_to :user

  has_one_attached :image

  belongs_to :category
  belongs_to :prefecture
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :delivery_time

  validates :image, presence: true
  validates :product, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }
  validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_time_id,
            presence: true,
            numericality: { other_than: 0 }
  validates :user, presence: true
end
