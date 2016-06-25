class MilkProduct < ActiveRecord::Base
  belongs_to :milk_brand
  belongs_to :milk_category
  has_many :milk_attributes
  has_many :milk_extra_attributes
  has_many :milk_product_images
  accepts_nested_attributes_for :milk_attributes
  accepts_nested_attributes_for :milk_extra_attributes
  accepts_nested_attributes_for :milk_product_images
end
