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
  employee = Employee.find_or_create_by(last_name: employee_info[1],
    first_name: employee_info[0],
    email: employee_info[2].gsub(/[()]/,''))

  product = Product.find_or_create_by(name: row['product_name'])

  customer_info = split_product(row['customer_and_account_no'])
  customer = Customer.find_or_create_by(name: customer_info[0].strip,
    account_number: customer_info[1])

  Sale.find_or_create_by(invoice_id: row['invoice_no']) do |sale|
    sale.employee_id = employee.id
    sale.customer_id = customer.id
    sale.product_id = product.id
    sale.sale_date = Chronic.parse(row['sale_date'])
    sale.sale_amount = row['sale_amount'].gsub(/[$]/,'')
    sale.units_sold = row['units_sold']
    sale.invoice_id = row['invoice_no']
    sale.invoice_freq = row['invoice_frequency']
  end

end
