class Product < ActiveRecord::Base
  has_many :sales

  def self.get_all_products
    Product.all
  end
end

