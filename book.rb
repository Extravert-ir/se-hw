class Book
  attr_accessor :id, :title, :date_taken

  def initialize(book_row)
    @customer_id = book_row[:customer_id]
    @id = book_row[:id]
    @title = book_row[:title]
    @date_taken = book_row[:date_taken]
  end

  def customer
    Customer.find(@customer_id) if taken?
  end

  def taken?
    !@customer_id.nil?
  end

  def give_to!(cust)
    return :already_taken if taken?
    return :too_much if cust.books_num > 2
    d = Date.today
    $DB.update_book(@id, customer_id: cust.id, date_taken: d)
    @customer_id = cust.id
    @date_taken = d
    :ok
  end

  def take!
    return :not_given if !taken?

    $DB.update_book(@id, customer_id: nil, date_taken: nil)
    @customer_id = nil
    @date_taken = nil
    :ok
  end

  def self.find(id)
    return nil if $DB.get_book(id).nil?
    Book.new($DB.get_book(id))
  end

	def self.all
    $DB.get_books.map { |b| Book.new(b) }
  end

  def self.expired
    Book.all.select { |b| b.taken? && b.date_taken.next_month <= Date.today }
  end
end