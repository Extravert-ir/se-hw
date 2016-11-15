module Controllers

  def self.router
    loop do
      case Views.wait_command
        when 'help'
          Views.help
        when 'list books'
          Controllers.list_books
        when 'list customers'
          Controllers.list_customers
        when 'list expired'
          Controllers.list_expired
        when 'give book'
          Controllers.give_book
        when 'take book'
          Controllers.take_book
        when 'exit'
          exit
        else
          Views.error_invalid_command
      end
    end
  end

  def self.list_books
    books = Book.all
    Views.list_books(books)
  end

  def self.list_customers
    customers = Customer.all
    Views.list_customers(customers)
  end

  def self.list_expired
    books = Book.expired
    Views.list_books(books)
  end

  def self.give_book
    params = Views.give_book

    book = Book.find(params[:book_id])
    Views.error_no_book(params[:book_id]) if book.nil?

    customer = Customer.find(params[:cust_id])
    Views.error_no_customer(params[:cust_id]) if customer.nil?

    return if book.nil? || customer.nil?

    status = book.give_to!(customer)

    if status == :ok
      Views.book_given_success(customer)
    elsif status == :already_taken # book already given
      Views.error_book_already_given
    elsif status == :too_much # customer has more than 3 books
      Views.error_more_than_3
    end
  end

  def self.take_book
    book_id = Views.take_book

    book = Book.find(book_id)

    if book.nil?
      Views.error_no_book(book_id)
      return 
    end    

    status = book.take!

    if status == :ok
      Views.book_taken_success
    elsif status == :not_given
      Views.error_book_not_given
    end
  end
end