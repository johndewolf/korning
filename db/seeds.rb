require 'csv'

datafile = Rails.root + 'db/data/sales.csv'

def split_employee_name(employee)
  employee.split(' ')
end

def split_product(product)
  product.split('(')
end

CSV.foreach(datafile, headers: true) do |row|

  employee_info = split_employee_name(row['employee'])
  Employee.find_or_create_by(last_name: employee_info[1],
    first_name: employee_info[0],
    email: employee_info[2].gsub(/[()]/,''))

  Product.find_or_create_by(name: row['product_name'])

  customer_info = split_product(row['customer_and_account_no'])
  Customer.find_or_create_by(name: customer_info[0].strip,
    account_number: customer_info[1])

    Sale.find_or_create_by(invoice_no: row['invoice_no']) do |sale|
    sale.employee = row['employee']
    sale.customer_and_account_no = row['customer_and_account_no']
    sale.product_name = row['product_name']
    sale.sale_date = row['sale_date']
    sale.sale_amount = row['sale_amount']
    sale.units_sold = row['units_sold']
    sale.invoice_no = row['invoice_no']
    sale.invoice_frequency = row['invoice_frequency']


end





#   populate_labels (in up)
#   def populate_lables
#     ProductionSechdule.all.each do |ps|
#       Label.find_or_create_by(name: ps.label) do |lbl|
#         lbl.name = ps.label
#       end
#     end
#   end
# end

# def link_labels
#   Productions Schedule.all.each do |ps|
#     label = Label.find_by(name: ps.label)
#     ps.update_attribute(:label_id, label.id)
#   end
# end
