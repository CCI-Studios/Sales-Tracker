class MoveSalesDataIntoValues < ActiveRecord::Migration
  def self.up
    Sale.all.each do |sale|
      sale.values.clear
      sale.values['off_campus_quantity'] = sale.off_campus
      sale.values['off_campus_value'] = sale.off_campus_value
      sale.values['off_campus_duration'] = sale.off_campus_duration
      sale.values['off_campus_featured_quantity'] = sale.off_campus_featured
      sale.values['off_campus_featured_value'] = sale.off_campus_featured_value
      sale.values['off_campus_featured_duration'] = sale.off_campus_featured_duration
      
      sale.values['restaurant_quantity'] = sale.restaurant
      sale.values['restaurant_value'] = sale.restaurant_value
      sale.values['restaurant_duration'] = sale.restaurant_duration
      sale.values['restaurant_featured_quantity'] = sale.restaurant_featured
      sale.values['restaurant_featured_value'] = sale.restaurant_featured_value
      sale.values['restaurant_featured_duration'] = sale.restaurant_featured_duration
      
      sale.values['service_quantity'] = sale.services
      sale.values['service_value'] = sale.services_value
      sale.values['service_duration'] = sale.services_duration
      sale.values['service_featured_quantity'] = sale.services_featured
      sale.values['service_featured_value'] = sale.services_featured_value
      sale.values['service_featured_duration'] = sale.services_featured_duration
      
      sale.values['ad_views'] = sale.ads
      sale.values['ad_value'] = sale.ads_value
      
      sale.values['email_blasts'] = sale.email_blast
      sale.values['email_blast_value'] = sale.email_blast_value
      
      sale.values['off_campus_carrots'] = sale.off_campus_carrots
      sale.values['restaurant_carrots'] = sale.restaurant_carrots
      sale.values['service_carrots'] = sale.service_carrots
      
      sale.values['carrot_value'] = sale.carrot
      sale.save
    end
  end

  def self.down
  end
end
