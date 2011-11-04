class Campaign < ActiveRecord::Base
  has_many :attempts
  
  def total_revenue
    attempts.collect(&:value).compact.sum
  end

  def revenue_per_contact
    total_revenue/attempts.count
  end
  
  def attempts_by_day
    attempts.group_by(&:year_day)
  end
  
  def active_days
    attempts_by_day.count
  end
  
  def avg_calls_per_day
    attempts.count/active_days.to_f
  end
  
  def new_contacts
    attempts.group_by(&:company_id)
  end
  
  def avg_new_calls_per_day
    new_contacts.count/active_days.to_f
  end
  
  def follow_ups_per_day
    avg_calls_per_day - avg_new_calls_per_day
  end
  
  def attempts_with_email
    attempts.group_by(&:email)[true]
  end
  
  def emails_per_day
    attempts_with_email.count/active_days.to_f
  end
  
  def attemps_with_sales
    attempts.sales
  end
  
  def contacts_per_sale
    attempts.count/attemps_with_sales.count.to_f
  end
  
  def units_per_sale
    total_units/attemps_with_sales.count.to_f
  end
  
  def total_duration 
    attemps_with_sales.collect { |attempt|
      attempt.off_campus_duration + attempt.off_campus_featured_duration + attempt.restaurant_duration +
        attempt.restaurant_featured_duration + attempt.services_duration + attempt.services_featured_duration +
        attempt.email_blast_duration + attempt.ads_duration
    }.sum
  end
  
  def total_units
    attemps_with_sales.collect { |attempt|
      attempt.off_campus + attempt.off_campus_featured + attempt.restaurant + 
        attempt.restaurant_featured + attempt.services + attempt.services_featured +
        attempt.email_blast + attempt.ads
    }.sum
  end
  
  def avg_unit_duration
    total_duration/total_units.to_f
  end
end
