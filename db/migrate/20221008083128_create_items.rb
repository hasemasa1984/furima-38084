class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,null: false, foreign_key: true
      t.string  :title, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null:false
      t.integer :delivery_charge_id, null: false
      t.integer :scheduled_delivery_id, null: false
      t.integer :product_price, null: false
      t.integer :prefecture_id, null: false
      t.text :products, null: false
      t.timestamps
    end
  end
end
