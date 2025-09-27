class PurchaseRecordForm
  include ActiveModel::Model
  attr_accessor :token, :postcode, :prefecture_id, :municipality, :street_address, :building_name, :telephone_number, :user_id,
                :item_id

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :street_address
    validates :telephone_number, format: { with: /\A(\d{10}|\d{11})\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Purchaser.create(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality,
                     street_address: street_address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
