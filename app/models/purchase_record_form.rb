class PurchaseRecordForm
  include ActiveModel::Model
  attr_accessor :token, :postcode, :prefecture_id, :municipality, :street_address, :building_name, :telephone_number, :user_id,
                :item_id

  validates :postcode, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :municipality, presence: true
  validates :street_address, presence: true
  validates :telephone_number, presence: true, format: { with: /\A(\d{10}|\d{11})\z/, message: 'is invalid' }
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality,
                           street_address: street_address, building_name: building_name, telephone_number: telephone_number, purchase_record_id: purchase_record.id)
  end
end
