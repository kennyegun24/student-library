# rubocop:disable Metrics/ClassLength

require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'

class App
  attr_accessor :book, :people, :rentals

  def initialize
    @book = []
    @people = []
    @rentals = []
  end

  # render on page load
  def run
    puts library_menu
    user_input = gets.chomp

    if user_input <= '6'
      options(user_input)
    elsif user_input == '7'
      puts 'Thanks for using the app!'
    else
      'Please select an option from 1 - 7'
    end
  end

  # Default return
  def back_to_menu
    puts ''
    print 'Press Enter to go back to menu: '
    gets.chomp
    run
  end

  # Library menu
  def library_menu
    puts 'Welcome👋 to School library App!'
    puts ''
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  # list books
  def list_books
    if @book.empty?
      puts 'No book available 😔'
      back_to_menu
    end
    puts 'List of all books: '
    @book.each_with_index do |list, i|
      puts "#{i}) Title: #{list.title}, Author: #{list.author}"
    end
    back_to_menu
  end

  # list people
  def list_people
    if @people.empty?
      puts 'No people available 😔'
      back_to_menu
    end
    puts 'List all people: '
    @people.each_with_index do |list, i|
      puts "#{i}) [#{list.class}] - Name: #{list.name}, ID: #{list.id} Age: #{list.age}"
    end
    back_to_menu
  end

  # create person
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2) [Input the number]'
    option = gets.chomp.to_i

    case option
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Please enter a number 1 or 2'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parents permission? [Y/N]: '
    permission = gets.chomp
    new_student = Student.new(age, permission, name)
    @people.push(new_student)
    puts 'Person created successfully'
    back_to_menu
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'specialization: '
    specialization = gets.chomp
    new_teacher = Teacher.new(age, specialization, name)
    @people.push(new_teacher)
    puts 'Teacher created successfully'
    back_to_menu
  end

  # Create a book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @book.push(new_book)
    puts 'Book created'
    back_to_menu
  end

  # create rentals
  def create_rental
    puts 'Select a book from the following by number '
    @book.each_with_index { |list, i| puts "#{i}) Title: #{list.title}, Author: #{list.author}" }
    index = gets.chomp.to_i
    book = @book[index]
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |list, i| puts "#{i}) Name: #{list.name}, ID: #{list.id} Age: #{list.age}" }
    index = gets.chomp.to_i
    person = @people[index]
    print 'Date(yyyy/mm/dd): '
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
    puts 'Rental created successfully'
    back_to_menu
  end

  # get all rentals
  def list_rentals
    puts 'Select ID of any person (Please type the number of the ID: '
    @people.each { |list| puts "Id: #{list.id}, Person: #{list.name} " }
    puts ''
    # get detals of rentals by id
    print 'Person id: '
    id = gets.chomp.to_i
    @rentals.each do |list|
      if list.person.id == id
        puts "Date: #{list.date}, Books: #{list.book.title} written by Author: #{list.book.author}"
      else
        puts 'Person ID not found'
      end
    end
  end

  # render based on user input
  def options(user_input)
    case user_input
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    else
      puts 'Enter a number between 1 - 7'
    end
  end
end
# rubocop:enable Metrics/ClassLength
