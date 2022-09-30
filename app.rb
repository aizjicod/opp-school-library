require_relative 'student'
require_relative 'teacher'

class App
  attr_accessor :listBooks, :listPersons
  def initialize
    @listBooks = []
    @listPersons = []
  end

  def create_person(type)
    case type
    when "1"
      create_student
    when "2"
      create_teacher
    else
      puts "this value is not correctly"
    end
    end

    def create_book 
      p 'introduce author name'
      p 'introduce title of book'

    end

    private
    def create_student
      puts 'introduce name, age, parent permission (optional), classroom'
      print "Name: "
      name = check_emptyness(gets.chomp).capitalize()
      print "Age: "
      age = is_number?(check_emptyness(gets.chomp).to_i) 
      print "Parent permission [Y,N]: "
      pa_pe = check_emptyness(gets.chomp).downcase
      case pa_pe
      when "y"
        pa_pe = true
      when "n"
        pa_pe = false
      else
        puts "invalid value"
      end
      print "Classroom: "
      classroom = check_emptyness(gets.chomp)
      newStudent = Student.new(age,name,pa_pe,classroom)
      puts "Created new student with id: #{newStudent.id}"
      p newStudent
      @listPersons << newStudent
    end

    def create_teacher
      puts 'introduce name, age, specialization'
      print "Name: "
      name = check_emptyness(gets.chomp).capitalize()
      print "Age: "
      age = is_number?(check_emptyness(gets.chomp).to_i) 
      print "Specialization: "
      spe = check_emptyness(gets.chomp)
      newTeacher = Teacher.new(age,name,spe)
      puts "Created new teacher with id: #{newTeacher.id}"
      @listPersons << newTeacher
    end

    def check_emptyness(value)
      while value.empty?
        puts "please enter value again"
        value =  gets.chomp
      end
      return value
    end

    def is_number?(value)
      while(value === false || value === 0)
        puts "age is not a number"
        value = check_emptyness(gets.chomp).to_i
        puts value
      end
     return value
    end
end