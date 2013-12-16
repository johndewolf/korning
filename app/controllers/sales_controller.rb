class SalesController < ActionController::Base
  def index
    @sales = Sale.get_all_sales
  end
end
