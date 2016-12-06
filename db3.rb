require 'date'

class DB3
  def initialize
    @books = [
      {id: 1, title: 'Doe tales', date_taken: nil, customer_id: nil},
      {id: 2, title: 'Doe tales1', date_taken: nil, customer_id: nil},
      {id: 3, title: 'Doe tales2', date_taken: Date.new(2016,9,2), customer_id: 1},
      {id: 4, title: 'Doe tales3', date_taken: Date.new(2016,11,2), customer_id: 2},
      {id: 5, title: 'Doe tales4', date_taken: Date.new(2016,11,10), customer_id: 2},
      {id: 6, title: 'Doe tales5', date_taken: Date.new(2016,10,1), customer_id: 2},
      {id: 7, title: 'Doe tales6', date_taken: nil, customer_id: nil}
    ]
    @customers = [
      {id: 1, name: 'John Doe'},
      {id: 2, name: 'Adam Smith'},
      {id: 3, name: 'Vasya Pupkin'}
    ]
  end

  def get_books
    @books
  end

  def get_book(id)
    book = @books.select { |b| b[:id] == id }
    return nil if book.empty?
    book[0]
  end

  def update_book(id, **params)
    book = get_book(id)
    return if book.nil?
    book.merge!(params)
  end

  def get_customers
    @customers
  end

  def get_customer(id)
    customer = @customers.select { |c| c[:id] == id }
    return nil if customer.empty?
    customer[0]
  end
end