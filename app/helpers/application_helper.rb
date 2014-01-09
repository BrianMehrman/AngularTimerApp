module ApplicationHelper
  def time_tense(date)
    date > DateTime.current ? "until" : "ago"

  end
end
