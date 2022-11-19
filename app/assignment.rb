require_relative 'validation'
require_relative 'computation'

class Assignment
  puts 'Please input first date with format DD/MM/YYY :'
  first_date = gets
  first_date = first_date.strip
  puts "Your first date is #{first_date}!"

  puts 'Please input last date with format DD/MM/YYY :'
  last_date = gets
  last_date = last_date.strip
  puts "Your last date is #{last_date}!"

  Validation.new(first_date, last_date).call
  puts Computation.new(first_date, last_date).call
end
