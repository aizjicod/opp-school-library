class Classroom
  attr_accessor :label
  attr_reader :student

  def initialize(label = 'math')
    @label = label
    @student = []
  end
end
