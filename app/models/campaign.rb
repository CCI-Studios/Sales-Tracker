class Campaign < ActiveRecord::Base
  has_many :attempts, :dependent => :destroy
  has_many :sales, :dependent => :destroy
  has_many :sale_items, :through => :sales
  has_many :products
  
  validates :title, :presence => true,
                    :uniqueness => { :case_sensitive => false }
  validates_numericality_of :goal,  :greater_than_or_equal_to => 0,
                                    :allow_nil => true

  scope :alphabetical, order("LOWER(title) ASC")

  # filters
  def attempts_with_email
    attempts.emailed
  end
  
  def attempts_by_day
    attempts.group_by(&:year_day)
  end
  
  def initial_contacts
    attempts.group_by(&:company_id).collect { |index, attempts|
      attempts.first
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
    listings.collect(&:quantity).compact.sum
  end
  
  def total_units
    sale_items.collect(&:quantity).compact.sum
  end
  
  def listings
    sale_items.filter_products('Listing')
  end
  
  def total_listings
    listings.count
  end
  
  def avg_unit_duration
    total_duration/total_listings.to_f
  end
  
  def off_campus_carrots
    sales.collect(&:off_campus_carrots).compact.sum
  end
  
  def restaurant_carrots
    sales.collect(&:restaurant_carrots).compact.sum
  end
  
  def service_carrots
    sales.collect(&:service_carrots).compact.sum
  end
end



# == Schema Information
#
# Table name: campaigns
#
#  id         :integer         primary key
#  title      :string(255)
#  start_date :date
#  end_date   :date
#  created_at :timestamp
#  updated_at :timestamp
#  goal       :integer
#

