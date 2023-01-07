require_relative 'rental'

class Book
  attr_accessor :author, :title, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_book(person, date)
    Rental.new(date, person, self)
  end
end
