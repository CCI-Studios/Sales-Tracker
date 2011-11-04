class Campaign < ActiveRecord::Base
  has_many :attempts
  
  def total_revenue
    attempts.collect(&:value).compact.sum
  end

  def revenue_per_contact
    total_revenue/attempts.count
  end
  
  def avg_calls_per_day
    days = attempts.group_by(&:year_day)
    attempts.count/days.count.to_f
  end
end
