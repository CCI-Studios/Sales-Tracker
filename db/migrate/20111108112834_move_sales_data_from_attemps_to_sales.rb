class MoveSalesDataFromAttempsToSales < ActiveRecord::Migration
  
  class Attempt < ActiveRecord::Base
  end

  class Sale < ActiveRecord::Base
  end    
    
  
  def self.up
    ActiveRecord::Base.transaction do
      Attempt.all.each do |a|
        if (!a.value.nil? && a.value != 0)
          s = Sale.new
          s.total = a.value
          s.company_id = a.company_id
          s.campaign_id = a.campaign_id
          s.created_at = a.created_at
          s.updated_at = a.updated_at
          s.user_id = a.user_id
          s.carrot = a.carrot
          s.off_campus = a.off_campus
          s.off_campus_value = a.off_campus_value
          s.off_campus_duration = a.off_campus_duration
          s.off_campus_featured = a.off_campus_featured
          s.off_campus_featured_value = a.off_campus_featured_value
          s.off_campus_featured_duration = a.off_campus_featured_duration
          s.restaurant = a.restaurant
          s.restaurant_value = a.restaurant_value
          s.restaurant_duration = a.restaurant_duration
          s.restaurant_featured = a.restaurant_featured
          s.restaurant_featured_value = a.restaurant_featured_value
          s.restaurant_featured_duration = a.restaurant_featured_duration
          s.services = a.services
          s.services_value = a.services_value
          s.services_duration = a.services_duration
          s.services_featured = a.services_featured
          s.services_featured_value = a.services_featured_value
          s.services_featured_duration = a.services_featured_duration
          s.email_blast = a.email_blast
          s.email_blast_value = a.email_blast_value
          s.ads = a.ads
          s.ads_value = a.ads_value
          
          s.save
        end
      end
    end
  end

  def self.down
  end
end
