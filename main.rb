#!/usr/bin/env ruby

require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def main
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
        '     [7] Exit',
        ''
      ]
      value = gets.chomp
      option_cases(value)
      break if value.to_i.zero? || value.to_i > 6
    end
  end

  def option_cases(value)
    case value
    when '1'
      @app.books
    when '2'
      @app.persons
    when '3'
      @app.create_person
    when '4'
      @app.create_book
    when '5'
      @app.create_rental
    when '6'
      @app.rentals_by_per_id
    else
      puts 'exiting...'
    end
  end
end

Main.new.main
