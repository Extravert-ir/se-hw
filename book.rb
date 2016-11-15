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
    $DB.books = $DB.books.map do |b|
      if b[:id] == @id
        b[:customer_id] = cust.id
        b[:date_taken] = Date.today
      end
      b
    end
    :ok
  end

  def take!
    return :not_given if !taken?

    $DB.books = $DB.books.map do |b|
      if b[:id] == @id
        b[:customer_id] = nil
        b[:date_taken] = nil
      end
      b
    end
    :ok
  end

  def self.find(id)
    book = $DB.books.select { |b| b[:id] == id }
    return nil if book.empty?
    return Book.new(book[0])
  end

	def self.all
    $DB.books.map { |b| Book.new(b) }
  end

  def self.expired
    Book.all.select { |b| b.taken? && b.date_taken.next_month <= Date.today }
  end
end