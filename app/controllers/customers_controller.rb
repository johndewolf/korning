class CustomersController < ActionController::Base
  def index
    @customers = Customer.get_all_customers
  end

end
