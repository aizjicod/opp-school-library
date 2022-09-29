require_relative 'person'

class Student < Person
  def initialize(name, age, _parent_permission, classroom)
    super(name, age, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    p "¯\(ツ)/¯"
  end

  def classroom(classroom)
    @classroom = classroom
    classroom.student << (self) unless classroom.student.include?(self)
  end
end
