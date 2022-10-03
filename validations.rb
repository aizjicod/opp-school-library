module Validations
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
