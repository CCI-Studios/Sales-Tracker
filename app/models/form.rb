class Form < ActiveRecord::Base
  belongs_to :campaign
  has_many :form_elements
  
  accepts_nested_attributes_for :form_elements, :reject_if => lambda { |a| a[:kind].blank? }, :allow_destroy => :true
  
end
