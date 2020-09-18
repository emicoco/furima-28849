class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.references :purchase_management, null: false, foreign_key: true
      t.string :post_number, null: false
      t.integer :shipping_origin_area_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :tel, null: false
      t.timestamps
    end
  end
end
