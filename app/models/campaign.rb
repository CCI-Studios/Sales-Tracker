class Campaign < ActiveRecord::Base
  def avg_calls_per_day
    days = attempts.group_by(&:year_day)
    attempts.count/days.count.to_f
  end
end
