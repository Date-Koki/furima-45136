class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.references :user, null:false, foreign_key: true
      t.string :product, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :price, null: false
      t.integer :shipping_fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_time_id, null: false
      
      t.timestamps
    end
  end
end
