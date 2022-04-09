require_relative './person'
require_relative './capitalize_name'
require_relative './trim_name'

person = Person.new(22, 'Aime')
puts person.correct_name
capitalized_person = CapitalizeName.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimeName.new(capitalized_person)
capitalized_trimmed_person.correct_name

puts capitalized_trimmed_person.correct_name
