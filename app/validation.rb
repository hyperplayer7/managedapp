# Validation Class
class Validation
  def initialize(first_date, last_date)
    @first_date = first_date || ''
    @last_date = last_date || ''
  end

  def call
    check_format
    check_valid_year
  end

  private

  def check_format
    raise 'Invalid Format' unless @first_date.match(date_format_regex) && @last_date.match(date_format_regex)
  end

  def date_format_regex
    @date_format_regex ||= %r{^(((0[1-9]|[12][0-9]|3[01])[- /.](0[13578]|1[02])|(0[1-9]|[12][0-9]|30)[- /.](0[469]|11)|(0[1-9]|1\d|2[0-8])[- /.]02)[- /.]\d{4}|29[- /.]02[- /.](\d{2}(0[48]|[2468][048]|[13579][26])|([02468][048]|[1359][26])00))$}
  end

  def split_first_date
    @split_first_date ||= @first_date.split('/')
  end

  def split_last_date
    @split_last_date ||= @last_date.split('/')
  end

  def check_valid_year
    raise('Invalid Year') unless valid_year
  end

  def valid_year
    (split_first_date[2].to_i >= 1900 && split_last_date[2].to_i >= 1900 && split_first_date[2].to_i <= 2999 && split_last_date[2].to_i <= 2999)
  end
end
