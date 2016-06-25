class MilkBrand < ActiveRecord::Base
  has_many :milk_products, dependent: :destroy
end
