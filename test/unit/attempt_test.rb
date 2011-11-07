require 'test_helper'

class AttemptTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: attempts
#
#  id                           :integer         not null, primary key
#  user_id                      :integer
#  email                        :boolean
#  phone                        :boolean
#  fax                          :boolean
#  created_at                   :datetime
#  updated_at                   :datetime
#  company_id                   :integer
#  campaign_id                  :integer
#  success                      :boolean
#  value                        :integer
#  carrot                       :integer
#  off_campus                   :integer         default(0), not null
#  off_campus_featured          :integer         default(0), not null
#  restaurant                   :integer         default(0), not null
#  restaurant_featured          :integer         default(0), not null
#  services                     :integer         default(0), not null
#  services_featured            :integer         default(0), not null
#  email_blast                  :integer         default(0), not null
#  ads                          :integer         default(0), not null
#  off_campus_value             :integer         default(0), not null
#  off_campus_featured_value    :integer         default(0), not null
#  restaurant_value             :integer         default(0), not null
#  restaurant_featured_value    :integer         default(0), not null
#  services_value               :integer         default(0), not null
#  services_featured_value      :integer         default(0), not null
#  email_blast_value            :integer         default(0), not null
#  ads_value                    :integer         default(0), not null
#  off_campus_duration          :integer         default(0), not null
#  off_campus_featured_duration :integer         default(0), not null
#  restaurant_duration          :integer         default(0), not null
#  restaurant_featured_duration :integer         default(0), not null
#  services_duration            :integer         default(0), not null
#  services_featured_duration   :integer         default(0), not null
#

