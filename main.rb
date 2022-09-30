#!/usr/bin/env ruby

require_relative 'app'
def main
  app = App.new
  puts 'Welcome to School Library App'
  loop do
    puts "\nPlease select an option by number :"
    puts [
      '',
      '     [1] List all books',
      '     [2] List all people',
      '     [3] Create a person',
      '     [4] Create a book',
      '     [5] Create a rental',
      '     [6] List all rentals for a given person id',
      '     [7] List all rentals',
      '     [8] Exit',
      ''
    ]
    value = gets.chomp
    case value
    when '1'
      app.books
    when '2'
      app.persons
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.rentals_by_per_id
    when '7'
      puts 'list of rentals'
      app.rentals.each_with_index {|rental, index|
        print "\n#{index + 1}) - "
        print "Date: #{rental.date} - "
        print "Book title: #{rental.book.title} - "
        print "Person name: #{rental.person.name}. "
      }
    else
      puts 'exiting...'
      break
    end
  end
end

main
