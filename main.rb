require_relative './person'
require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './capitalize_name'
require_relative './trim_name'

person = Person.new(22, 'Aime')
puts person.correct_name
capitalized_person = CapitalizeName.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimeName.new(capitalized_person)
capitalized_trimmed_person.correct_name

puts capitalized_trimmed_person.correct_name

student1 = Person.new(22, 'Malaika')
student2 = Person.new(27, 'MalaikaAime')

book1 = Book.new('Book1 Title', 'Book1 Author')
book2 = Book.new('Book2 Title', 'Book2 Author')
book3 = Book.new('Book3 Title', 'Book3 Author')

rental1 = Rental.new(book1, student1)
rental2 = Rental.new(book2, student1)
rental3 = Rental.new(book3, student2)

puts "Total books rented by #{student1.name} = #{student1.rentals.length}"
puts rental1.show_rental, rental2.show_rental, rental3.show_rental
