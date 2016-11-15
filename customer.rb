class Customer
  attr_accessor :id, :name

  def initialize(cust_row)
    @id = cust_row[:id]
    @name = cust_row[:name]
  end

  def books_num
    count = 0
    $DB.books.each {|b| count += 1 if b[:customer_id] == @id }
    count
  end

  def self.find(id)
    customer = $DB.customers.select { |b| b[:id] == id }
    return nil if customer.empty?
    return Customer.new(customer[0])
  end

  def self.all
    $DB.customers.map { |b| Customer.new(b) }
  end
end