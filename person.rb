require_relative 'nameable'
require_relative 'book'
require_relative 'rental'


class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rental

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1000..9999)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    return if of_age? || @parent_permission

    true
  end

  def add_book_rental(book, date)
    Rental.new(date, book, self)
  end
end
