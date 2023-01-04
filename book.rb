class Book
  attr_accessor :author, :title, rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end
end
