attr_accessor 'rental'

class Book
  attr_accessor :author, :title, rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def rent_book(person, date)
    Rental.new(date, person, self)
  end
end
