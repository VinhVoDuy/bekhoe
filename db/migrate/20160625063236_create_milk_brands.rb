class CreateMilkBrands < ActiveRecord::Migration
  def change
    create_table :milk_brands do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
