class CreateMilkProductImages < ActiveRecord::Migration
  def change
    create_table :milk_product_images do |t|
      t.belongs_to :milk_product, index: true, foreign_key: true
      t.attachment :image

      t.timestamps null: false
    end
  end
end
