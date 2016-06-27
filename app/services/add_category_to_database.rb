class AddCategoryToDatabase
  def initialize(json_data)
    @json_data = json_data
  end

  def run
    @json_data['categories'].each do |category|
      category_id = MilkCategory.find_or_create_by(name: category['name']).id
      category['link'][0]['products'].each do |product|
        AddProductToDatabase.new(product, category_id).run
      end
    end
  end
end
