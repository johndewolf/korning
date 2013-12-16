class Employee < ActiveRecord::Base
  has_many :sales

  def self.get_all_employees
    Employee.all
  end
end
