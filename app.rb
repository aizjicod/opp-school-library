require_relative 'student'
require_relative 'teacher'
require_relative 'books'
require_relative 'rentals'

class App
  attr_accessor :list_books, :list_persons

  def initialize
    @list_books = []
    @list_persons = []
  end

  def books
    if @list_books.empty?
      puts "\nthere's no books avalaible"
    else
      @list_books.each_with_index do |book, index|
        print "\n#{index + 1}) - "
        print "author: #{book.author} ~ "
        print "title: #{book.title}"
      end
    end
  end

  def persons
    if @list_persons.empty?
      puts ''
      puts "there's no person avalaible"
    else
      @list_persons.each_with_index do |per, index|
        print "\n#{index + 1}) - "
        print "[#{per.class.name}] id: #{per.id} ~ name: #{per.name} ~ age: #{per.age}"
        print " ~ specialization: #{per.specialization}" if per.methods.include? :specialization
      end
    end
  end

  def create_person
    puts 'Do you want to create a Student(1) or a Teacher(2)?'
    person_type = check_emptyness(gets.chomp)
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'this value is not correctly'
    end
  end

  def create_book
    print 'introduce author name: '
    author = check_emptyness(gets.chomp).capitalize
    print 'introduce title of book: '
    title = check_emptyness(gets.chomp).capitalize
    new_book = Book.new(title, author)
    @list_books << new_book
    puts 'the book as succesfully created'
  end

  def create_rental
    if @list_books.empty? && @list_persons.empty?
      puts 'there are no books or person avalible'
    else
      puts 'choose a book'
      books
      print "\nIntroduce book index: "
      book_index = number?(check_emptyness(gets.chomp).to_i)
      puts 'choose a person'
      persons
      print "\nIntroduce person index: "
      person_index = number?(check_emptyness(gets.chomp).to_i)
      print 'introduce date: '
      date = check_emptyness(gets.chomp)
      Rental.new(date, @list_books[book_index - 1], @list_persons[person_index - 1])
      puts 'a rental was created'
    end
  end

  def rentals_by_per_id
    puts 'choose a person by id'
    persons
    print "\nIntroduce id: "
    person_id = number?(check_emptyness(gets.chomp).to_i)
    person_avalaible = false
    @list_persons.each do |per|
      next unless per.id.equal? person_id

      puts "\nRentals :\n"
      per.rental.each do |rental|
        puts "\nDate: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
      person_avalaible = true
    end
    puts 'this ID is not valid' unless person_avalaible
  end

  private

  def create_student
    puts 'introduce name, age, parent permission (optional), classroom'
    print 'Name: '
    name = check_emptyness(gets.chomp).capitalize
    print 'Age: '
    age = number?(check_emptyness(gets.chomp).to_i)
    print 'Parent permission [Y,N]: '
    pa_pe = check_emptyness(gets.chomp).downcase
    pa_pe = case pa_pe
            when 'n'
              false
            else
              true
            end
    print 'Classroom: '
    classroom = check_emptyness(gets.chomp)
    new_student = Student.new(age, name, pa_pe, classroom)
    puts "Created new student with id: #{new_student.id}"
    @list_persons << new_student
  end

  def create_teacher
    puts 'introduce name, age, specialization'
    print 'Name: '
    name = check_emptyness(gets.chomp).capitalize
    print 'Age: '
    age = number?(check_emptyness(gets.chomp).to_i)
    print 'Specialization: '
    spe = check_emptyness(gets.chomp)
    new_teacher = Teacher.new(age, name, spe)
    puts "Created new teacher with id: #{new_teacher.id}"
    @list_persons << new_teacher
  end

  def check_emptyness(value)
    while value.empty?
      puts 'please enter value again'
      value = gets.chomp
    end
    value
  end

  def number?(value)
    while [false, 0].include?(value)
      puts 'age is not a number'
      value = check_emptyness(gets.chomp).to_i
      puts value
    end
    value
  end
end
