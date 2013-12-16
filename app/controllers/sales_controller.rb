class SalesController < ActionController::Base
  def index
    @sales = Sale.get_all_sales
  end

  # def show
  #   @sale = Sale.find(params[:id])
  # end

  # def filter(params)
  #   # if params[:filter] == 'Employees'
  #   #   Employee.____
  # end
end
