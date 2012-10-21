module ApplicationHelper

  def format_date(date)
    date.to_formatted_s(:long)
  end

  def format_month_day(date)
    date.strftime("%b. %d")
  end

  def format_year(date)
    date.year
  end

  def days_until(date, options = {})
    options[:include_label] = true if options[:include_label].nil?
    days = (date - Date.today).to_i
    if options[:include_label]
      "#{days} #{days_until_label date}"
    else
      "#{days}"
    end
  end

  def days_until_label(date)
    days = (date - Date.today).to_i
    days == 1 ? 'day' : 'days'
  end
end
