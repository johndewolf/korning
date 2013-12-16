class EmployeesController < ActionController::Base
  def index
    @employees = Employee.get_all_employees
  end

  def show
    @employee = Employee.joins(:sales).find(params[:id])
  end
end
