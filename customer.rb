class Customer
  attr_accessor :id, :name

  def initialize(cust_row)
    @id = cust_row[:id]
    @name = cust_row[:name]
  end

  def books_num
    count = 0
    $DB.get_books.each {|b| count += 1 if b[:customer_id] == @id }
    count
  end

  def self.find(id)
    return nil if $DB.get_customer(id).nil?
    Customer.new($DB.get_customer(id))
  end

  def self.all
    $DB.get_customers.map { |b| Customer.new(b) }
  end
end