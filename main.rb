require_relative './person'
require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './capitalize_name'
require_relative './trim_name'
require_relative './app'

class Main < App
  def initialize
    super()
    @book = []
    @person = []
    @rental = []
    puts 'Welcome to the library!'
  end

  def ask
    puts 'Select Option'
    puts '================'
    puts "1. List all books \n2. List all persons \n3. Create a book \n4. Create a person
    \n5. Rent a book \n6. List all rentals per person \n7. Exit"
    puts
    option = gets.chomp
    case option
    when '1'
      list_book(@book)
      ask
    when '2'
      list_persons(@person)
      ask
    when '3'
      create_new_book
      ask
    end
    run(option)
  end

  def add_persons
    puts "Do you want to create \n1. a student or \n2. a teacher? [Inpt the number]"
    case gets.chomp
    when '1'
      person_student
    when '2'
      person_teacher
    end
    ask
  end

  def person_student
    puts 'Enter the name of the student'
    name = gets.chomp
    puts 'Enter the age of the student'
    age = gets.chomp
    classroom = 'Math'
    new_student = Student.new(classroom, age, name)
    create_person(@person, new_student)
    puts "Student #{name} has been added to the library"
  end

  def person_teacher
    puts 'Enter the name of the teacher'
    name = gets.chomp
    puts 'Enter the age of the teacher'
    age = gets.chomp
    puts 'Enter the specialization of the teacher'
    specialization = gets.chomp
    new_teacher = Teacher.new(specialization, age, name)
    create_person(@person, new_teacher)
    puts "Teacher #{name} has been added to the library"
  end

  def append_rental
    puts 'Select a book'
    @book.each_with_index { |book, index| puts "#{index}: #{book.title}" }
    book_index = gets.chomp.to_i
    puts 'Select a person'
    @person.each_with_index { |person, index| puts "#{index}: #{person.name}" }
    person_index = gets.chomp.to_i
    new_rent = Rental.new(@book[book_index], @person[person_index])
    rent_book(@rental, new_rent)
    puts "Book #{@book[book_index].title} has been rented to #{@person[person_index].name}"
  end

  def create_new_book
    puts 'Enter the title of the book'
    title = gets.chomp
    puts 'Enter the author of the book'
    author = gets.chomp
    new_book = Book.new(title, author)
    create_book(@book, new_book)
    puts "Book #{title} by #{author} has been added to the library"
  end

  def filter_list_book
    puts 'Select a person id'
    @person.each { |person| puts "#{person.id}: #{person.name}" }
    puts 'Enter the id'
    id = gets.chomp
    @rental.each do |rentals|
      puts rentals.show_rental if rentals.person_id.to_s == id
    end
  end

  def run(num)
    case num
    when '4'
      add_persons
    when '5'
      append_rental
      ask
    when '6'
      filter_list_book
      ask
    when '7'
      puts 'Goodbye!'
    end
  end
end

Main.new.ask
