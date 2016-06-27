class AddPublishedToProducts < ActiveRecord::Migration
  def change
    add_column :milk_products, :published, :boolean, default: false
  end
end
