class Person
  attr_reader :id, :parent_permission
  attr_accessor :age, :name

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    return true if age >= 18

    false
  end

  public

  def can_use_services?
    return true if of_age? || parent_permission

    false
  end
end

person_one = Person.new(23, 'Aime')
person_two = Person.new(16, 'John', parent_permission: false)
puts "person_one: #{person_one.can_use_services?}"
puts "person_two: #{person_two.can_use_services?}"
