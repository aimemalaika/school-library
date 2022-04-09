class App
  def list_book(books)
    if books.empty?
      puts 'No books in the library'
    else
      books.each { |book| puts "#{book.title} by #{book.author}" }
    end
  end

  def list_persons(persons)
    if persons.empty?
      puts 'No persons in the library'
    else
      persons.each { |person| puts "#{person.id}: #{person.name}  #{person.age}" }
    end
  end

  def create_book(books, book)
    books.push(book)
  end

  def create_person(persons, person)
    persons.push(person)
  end

  def rent_book(rentals, rental)
    rentals.push(rental)
  end
end
