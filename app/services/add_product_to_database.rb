class AddProductToDatabase
  def initialize(json_data, category_id)
    @json_data = json_data
    @category_id = category_id
  end

  def run
    name = @json_data["name"]
    bibomart_sku = @json_data["sku"]
    price = @json_data["price"].to_i
    milk_attributes =  @json_data["attributes"].map{ |attribute| {value: attribute} }
    detail = @json_data["detail"]

    MilkProduct.create(name: name, bibomart_sku: bibomart_sku, price: price, milk_brand_id: process_brand, detail: detail, milk_attributes_attributes: milk_attributes, milk_extra_attributes_attributes: process_extra_attributes, milk_product_images_attributes: process_images, milk_category_id: @category_id)
  end

  def process_extra_attributes
    @json_data["detail_attributes"].reject{|attribute| attribute['name'].nil? && attribute['value'].nil?}
  end

  def process_brand
    MilkBrand.find_or_create_by(name: @json_data["brand"]).id
  end

  def process_images
    @json_data["img"].map do |src|
      { image: src }
    end
  end
end
