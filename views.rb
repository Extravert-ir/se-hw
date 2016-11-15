require 'terminal-table'

module Views
  def self.wait_command
    puts 'Enter command >>'
    gets.chomp
  end

  def self.help
    puts '========='
    puts 'Commands:'
    puts '========='
    puts 'list books'
    puts 'list customers'
    puts 'list expired'
    puts 'give book'
    puts 'take book'
    puts 'exit'
  end

  def self.list_books(books)
    table = Terminal::Table.new do |t|
      t << ['Book id', 'Title', 'Customer', 'Date taken']
      t << :separator
      books.each do |b|
        t << [b.id, b.title, b.taken? ? b.customer.name : nil, b.taken? ? b.date_taken : nil]
      end
    end
    puts table
  end

  def self.list_customers(cust)
    table = Terminal::Table.new do |t|
      t << ['Cust id', 'Name', 'Books num']
      t << :separator
      cust.each do |c|
        t << [c.id, c.name, c.books_num]
      end
    end
    puts table
  end

  def self.give_book
    puts 'Enter book id >>'
    book_id = gets.chomp.to_i
    puts 'Enter customer id >>'
    cust_id = gets.chomp.to_i

    {book_id: book_id, cust_id: cust_id}
  end

  def self.take_book
    puts 'Enter book id >>'
    gets.chomp.to_i
  end

  def self.book_given_success(cust)
    puts 'Book successfully given'
  end

  def self.book_taken_success
    puts 'Book successfully taken'
  end

  def self.error_invalid_command
    puts 'invalid command'
  end

  def self.error_no_book(book_id)
    puts "No book with such id: \"#{book_id}\""
  end

  def self.error_no_customer(cust_id)
    puts "No customer with such id: \"#{cust_id}\""
  end

  def self.error_book_already_given
    puts 'This book has already been given'
  end

  def self.error_more_than_3
    puts 'Customer cannot have more than 3 books'
  end

  def self.error_book_not_given
    puts 'This book has not been given'
  end
end