require_relative 'book'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @book = book
    @date = date
    @person = person
    book.rentals << self
    person.rentals << self
  end
end
