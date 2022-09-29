class Classroom
  attr_accessor :label
  attr_reader :student

  def initialize(label = 'math')
    @label = label
    @student = []
  end

  def add_student(student)
    @student << (student) unless @student.include?(student)
  end
end
