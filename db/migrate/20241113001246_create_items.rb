class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title,null:false
      t.text :description, null: false
      t.integer :category_id,null: false
      t.integer :product_status_id,null: false
      t.integer :shipping_fee_id,null: false
      t.integer :prefecture_id,null: false
      t.integer :days_up_to_delivery_id,null: false
      t.integer :price ,null: false  
      t.timestamps
    end
  end
end
