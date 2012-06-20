module ApplicationHelper
  def date_format(time)
    time.strftime('%Y-%m-%d %H:%M')
  end
end
