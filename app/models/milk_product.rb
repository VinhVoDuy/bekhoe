class MilkProduct < ActiveRecord::Base
  belongs_to :milk_brand
  belongs_to :milk_category
  has_many :milk_attributes, dependent: :destroy
  has_many :milk_extra_attributes, dependent: :destroy
  has_many :milk_product_images, dependent: :destroy
  accepts_nested_attributes_for :milk_attributes, allow_destroy: true
  accepts_nested_attributes_for :milk_extra_attributes, allow_destroy: true
  accepts_nested_attributes_for :milk_product_images, allow_destroy: true
end
