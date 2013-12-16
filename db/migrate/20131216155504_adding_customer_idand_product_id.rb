class AddingCustomerIdandProductId < ActiveRecord::Migration
  def change
    add_column :sales, :customer_id, :integer
    add_column :sales, :product_id, :integer
  end
end
