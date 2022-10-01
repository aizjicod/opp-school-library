require_relative 'person'

class Student < Person
  def initialize(age, name, _parent_permission, classroom)
    super(age, name, parent_permission: true)
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
