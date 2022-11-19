# Switcher Class
class Switcher
  def initialize(first_date, last_date)
    @first_date = first_date || ''
    @last_date = last_date || ''
  end

  def call
    should_switch?
  end

  private

  def should_switch?
    should_switch = false
    if split_first_date[2] > split_last_date[2]
      # 01-01-2003 01-01-2002
      should_switch = true
    elsif split_first_date[2] == split_last_date[2] && split_first_date[1] > split_last_date[1]
      # 01-02-2002 01-01-2002
      should_switch = true
    elsif split_first_date[2] == split_last_date[2] && split_first_date[1] == split_last_date[1] && split_first_date[0] > split_last_date[0]
      # 02-01-2002 01-01-2002
      should_switch = true
    end
    should_switch
  end

  def split_first_date
    @split_first_date ||= @first_date.split('/')
  end

  def split_last_date
    @split_last_date ||= @last_date.split('/')
  end
end
