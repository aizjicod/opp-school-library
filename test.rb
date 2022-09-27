require './person'
require './student'
require './teacher'

# !this page will only be used to test the functionalities from the classes

puts ale = Person.new(15, 'alejandro', parent_permission: false)
puts ale_s = Student.new('alejandro', false, 15, 'math')
ale_t = Teacher.new('alejandro', 15, 'math')
p ale.id
p ale.age
p ale.name
ale.name = 'pedro'
p ale.name
p ale.age = 17
p ale.age
ale.can_use_services?
ale_s.play_hooky
p ale_t.can_use_services?
