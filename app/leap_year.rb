# Leap Year Class
class LeapYear
  def initialize(first_date, last_date)
    @first_date = first_date || ''
    @last_date = last_date || ''
  end

  def call
    total_leap_years
  end

  private

  def leap_year?(year)
    ((year.to_f / 4) % 1).zero?
  end

  def split_first_date
    @split_first_date ||= @first_date.split('/')
  end

  def split_last_date
    @split_last_date ||= @last_date.split('/')
  end

  def total_leap_years
    leap_years = 0
    (split_first_date[2].to_i..split_last_date[2].to_i).each do |i|
      next if i == split_first_date[2].to_i || i == split_last_date[2].to_i

      leap_years += 1 if leap_year?(i)
    end
    leap_years
  end
end
