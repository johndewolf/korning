class ProductsController < ActionController::Base
  def index
    @products = Product.get_all_products
  end

end
