class Admin::MilkProductsController < AdminController
  before_action :load_product, only: [:show, :edit]
  def index
    if params[:status].present?
      @products = MilkProduct.includes(:milk_brand).where(published: (params[:status] == 'published'))
    else
      @products = MilkProduct.includes(:milk_brand)
    end
  end

  def show
  end

  def edit
  end

  def update
    @product = MilkProduct.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to admin_milk_product_path(@product)
    else
      flash.now[:error] = @product.errors.full_messages
      render :edit
    end
  end

  def edit_detail
    @product = MilkProduct.find(params[:id])
  end

  def change_status
    @product = MilkProduct.find(params[:id])
    @product.update_attributes!(published: !@product.published)
  end

  private
  def load_product
    @product = MilkProduct.includes(:milk_brand, :milk_product_images, :milk_attributes, :milk_extra_attributes).find(params[:id])
  end

  def product_params
    params.require(:milk_product).permit(:id, :price, :milk_brand_id, :detail, milk_product_images_attributes: [:id, :image, :_destroy], milk_attributes_attributes: [:id, :value], milk_extra_attributes_attributes: [:id, :name, :value])
  end
end
