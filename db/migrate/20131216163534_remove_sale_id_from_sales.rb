class RemoveSaleIdFromSales < ActiveRecord::Migration
  def change
    remove_column :sales, :sale_id
  end
end
