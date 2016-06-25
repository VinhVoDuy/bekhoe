class CreateMilkExtraAttributes < ActiveRecord::Migration
  def change
    create_table :milk_extra_attributes do |t|
      t.string :name
      t.string :value
      t.belongs_to :milk_product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
