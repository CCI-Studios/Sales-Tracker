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
#  id          :integer         primary key
#  user_id     :integer
#  email       :boolean
#  phone       :boolean
#  fax         :boolean
#  created_at  :timestamp
#  updated_at  :timestamp
#  company_id  :integer
#  campaign_id :integer
#  verbal      :boolean
#  value       :integer
#

