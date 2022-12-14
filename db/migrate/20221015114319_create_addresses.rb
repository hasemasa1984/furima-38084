class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order,null: false, foreign_key: true
      t.integer :prefecture_id,null:false
      t.string :zipcode,null:false
      t.string :addr_city,null:false
      t.string :addr_num,null:false
      t.string :building
      t.string :phone_number,null:false
      t.timestamps
    end
  end
end
