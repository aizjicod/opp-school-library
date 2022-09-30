#!/usr/bin/env ruby

require_relative 'app'
def main 
  app = App.new()
  exit_key = true
  while exit_key
    puts ""
    puts "Welcome to School Library App \n \nPlease choose an action by selecting a number"
    puts "1 - list of books"
    puts "2 - list all person"
    puts "3 - Create a person"
    puts "4 - Create a books"
    puts "5 - Create a rental"
    puts "6 - List all rental for a given person id"
    puts "7 - Exit App"
    value = gets.chomp

    case value
    when "1"
      if app.listBooks.empty?
        puts ""
        puts "there's no books avalaible"
      else
        app.listBooks.each{|book| 
        puts "author: #{book.author}" 
        puts "title: #{book.title}"}
      end

    when "2"
      if app.listPersons.empty?
        puts ""
        puts "there's no person avalaible"
      else
        app.listPersons.each{|per| 
        puts "id #{per.id}"
        puts "name: #{per.name}" 
        puts "age: #{per.age}"
        if(per.methods.include? :specialization)
          puts "specialization: #{per.specialization}"
        end
      }
        
      end

    when "3"
      puts "Do you want to create a Student(1) or a Teacher(2)?"
      person_type = gets.chomp
      
      while person_type.empty?
        puts "this should not be empty"
        person_type = gets.chomp
      end
      app.create_person(person_type)
    when "4"
      p "selected 4"
    when "5"
     p  "selected 5"
    when "6"
      p "selected 6"
    when "7"
      p "exiting..."
      break
    else
      p "exiting..."
      break
    end
  end
end

main()