class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :category, null: false
      t.text :description, null: false
      t.integer :status, null: false
      t.integer :shipping_origin_area, null: false
      t.integer :shipping_days, null: false
      t.integer :postage, null: false
      t.integer :shipping_method, null: false
      t.timestamps
    end
  end
end
