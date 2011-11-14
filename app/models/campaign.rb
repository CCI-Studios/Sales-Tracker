class Campaign < ActiveRecord::Base
  has_many :attempts, :dependent => :destroy
  has_many :sales, :dependent => :destroy
  
  validates :title, :presence => true,
                    :uniqueness => { :case_sensitive => false }
  validates_numericality_of :goal,  :greater_than_or_equal_to => 0,
                                    :allow_nil => true
    

  default_scope :order => "LOWER(title) ASC"

  # filters
  def attempts_with_email
    attempts.emailed
  end
  
  def attempts_by_day
    attempts.group_by(&:year_day)
  end
  
  def initial_contacts
    attempts.group_by(&:company_id).collect { |index, attempts|
      attempts.last
    }
  end
  
  # calcs
  def total_revenue
    sales.collect(&:total).compact.sum
  end

  def revenue_per_contact
    total_revenue/attempts.count.to_f
  end
  
  def avg_calls_per_day
    attempts.count/active_days.to_f
  end
  
  def avg_new_calls_per_day
    initial_contacts.count/active_days.to_f
  end

  def goal_percent
    return '-' if goal.nil?
    total_revenue / goal.to_f * 100
  end
  
  # counts
  def active_days
    attempts_by_day.count
  end

  def follow_ups_per_day
    avg_calls_per_day - avg_new_calls_per_day
  end
  
  def emails_per_day
    attempts_with_email.count/active_days.to_f
  end
  
  
  def contacts_per_sale
    attempts.count/sales.count.to_f
  end
  
  def units_per_sale
    total_units/sales.count.to_f
  end
  
  def total_duration 
    sales.collect { |sale|
      sale.off_campus_duration + sale.off_campus_featured_duration + sale.restaurant_duration +
        sale.restaurant_featured_duration + sale.services_duration + sale.services_featured_duration
    }.sum
  end
  
  def total_units
    sales.collect { |sale|
      sale.off_campus + sale.off_campus_featured + sale.restaurant + 
        sale.restaurant_featured + sale.services + sale.services_featured +
        sale.email_blast + sale.ads
    }.sum
  end
  
  def total_listings
    sales.collect { |sale|
      sale.off_campus + sale.off_campus_featured + sale.restaurant + 
        sale.restaurant_featured + sale.services + sale.services_featured
    }.sum
  end
  
  def avg_unit_duration
    total_duration/total_listings.to_f
  end
end


# == Schema Information
#
# Table name: campaigns
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#  goal       :integer
#

