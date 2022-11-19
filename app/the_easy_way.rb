require 'date'

puts 'Please input first date with format DD/MM/YYY :'
first_date = gets
first_date = first_date.strip
puts "Your first date is #{first_date}!"

puts 'Please input last date with format DD/MM/YYY :'
last_date = gets
last_date = last_date.strip
puts "Your last date is #{last_date}!"

date1 = Date.strptime(first_date, '%d/%m/%Y')
date2 = Date.strptime(last_date, '%d/%m/%Y')

puts (date2 - date1).to_i - 1
