class Customer < ActiveRecord::Base
  has_many :sales

  def self.get_all_customers
    Customer.all
  end
end
