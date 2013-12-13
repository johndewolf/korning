class ChangeCustomerNumber < ActiveRecord::Migration
  def change
    change_column :customers, :account_number, :string
  end
end
