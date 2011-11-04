class Attempt < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :contact
  
  def campaign_name
    campaign.title if campaign
  end
  
  def campaign_name=(name)
    # self.campaign = Campaign.find_or_create_by_title(name) unless name.blank?
    self.campaign = Campaign.find_by_title(name) unless name.blank?
  end
  
  def contact_name
    contact.fullname if contact
  end
  
  def contact_name=(name)
    return unless !name.blank?
    f = name.split(", ")[1]
    l = name.split(", ")[0]
    self.contact = Contact.where(:first_name => f, :last_name => l).first
  end
  
end
