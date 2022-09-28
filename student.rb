require_relative 'person'

class Student < Person
  attr_accessor :classroom
  def initialize(name, age, _parent_permission, classroom)
    super(name, age, parent_permission: true)
    @classroom = classroom
    @classroom.student << (self)
  end

  def play_hooky
    p "¯\(ツ)/¯"
  end
end
