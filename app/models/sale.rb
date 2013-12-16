class Sale < ActiveRecord::Base
  belongs_to :customers
  belongs_to :employees
  belongs_to :products


  def self.get_all_sales
    Sale.where(sale_date: (15.months.ago)..(Time.now))
  end
end
