class CreateMilkProducts < ActiveRecord::Migration
  def change
    create_table :milk_products do |t|
      t.string :name
      t.string :bibomart_sku
      t.integer :price
      t.belongs_to :milk_brand, index: true, foreign_key: true
      t.belongs_to :milk_category, index: true, foreign_key: true
      t.text :detail

      t.timestamps null: false
    end
  end
end
