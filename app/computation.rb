require_relative 'leap_year'
require_relative 'switcher'

# Computation Class
class Computation
  def initialize(first_date, last_date)
    @first_date = first_date || ''
    @last_date = last_date || ''
  end

  def call
    @first_date, @last_date = @last_date, @first_date if should_switch
    "#{final_total} days"
  end

  private

  def final_total
    @final_total ||= total.positive? ? total - 1 : 0
  end

  def total
    @total ||= (last_total - first_total) + leap_years
  end

  def monthdays
    @monthdays ||= [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  end

  def split_first_date
    @split_first_date ||= @first_date.split('/')
  end

  def split_last_date
    @split_last_date ||= @last_date.split('/')
  end

  def first_total
    @first_total ||= (split_first_date[2].to_i * 365) + split_first_date[0].to_i + compute_month(split_first_date)
  end

  def last_total
    @last_total ||= (split_last_date[2].to_i * 365) + split_last_date[0].to_i + compute_month(split_last_date)
  end

  def compute_month(date)
    compute_month = 0
    (0..date[1].to_i - 1).each do |i|
      compute_month += monthdays[i]
      compute_month += 1 if i == 1 && leap_year?(date[2])
    end
    compute_month
  end

  def leap_year?(year)
    ((year.to_f / 4) % 1).zero?
  end

  def leap_years
    @leap_years ||= LeapYear.new(@first_date, @last_date).call
  end

  def should_switch
    @should_switch ||= Switcher.new(@first_date, @last_date).call
  end
end
