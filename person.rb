require_relative 'nameable'
require_relative 'rentals'
class Person < Nameable
  attr_accessor :name, :age, :id, :rental

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services?
    p of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age > 18
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
