class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :employee_id
      t.integer :sale_id
      t.date :sale_date
      t.decimal :sale_amount
      t.integer :units_sold
      t.integer :invoice_id
      t.string :invoice_freq

      t.timestamps
    end
  end
end
