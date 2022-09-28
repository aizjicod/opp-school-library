class Classroom
  attr_accessor :label, :student

  def initialize(label = 'math')
    @label = label
    @student = []
  end
end
