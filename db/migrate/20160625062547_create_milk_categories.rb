class CreateMilkCategories < ActiveRecord::Migration
  def change
    create_table :milk_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
