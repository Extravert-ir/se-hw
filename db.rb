require 'date'

class DB
  attr_accessor :books, :customers

  def initialize
    @books = [
      {id: 1, title: 'Hobbit', date_taken: nil, customer_id: nil},
      {id: 2, title: 'Hobbit1', date_taken: nil, customer_id: nil},
      {id: 3, title: 'Hobbit2', date_taken: Date.new(2016,9,2), customer_id: 1},
      {id: 4, title: 'Hobbit3', date_taken: Date.new(2016,11,2), customer_id: 2},
      {id: 5, title: 'Hobbit4', date_taken: Date.new(2016,11,10), customer_id: 2},
      {id: 6, title: 'Hobbit5', date_taken: Date.new(2016,10,1), customer_id: 2},
      {id: 7, title: 'Hobbit6', date_taken: nil, customer_id: nil}
    ]
    @customers = [
      {id: 1, name: 'John Doe'},
      {id: 2, name: 'Adam Smith'},
      {id: 3, name: 'Vasya Pupkin'}
    ]
  end
end