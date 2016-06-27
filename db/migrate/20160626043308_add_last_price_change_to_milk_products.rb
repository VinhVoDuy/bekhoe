class AddLastPriceChangeToMilkProducts < ActiveRecord::Migration
  def change
    add_column :milk_products, :last_price_change, :datetime
  end
end
