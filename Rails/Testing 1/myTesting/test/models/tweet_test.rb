require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  #This is using the shoulda gem
  should validate_presence_of(:status)
  #should ensure_length_of(:status).is_at_least(1).is_at_most(180)
  should belong_to(:zombie)
  #should validate_uniqueness_of(:status)
  #should validate_numericality_of(:id)
  #should_not allow_value("toto").for(:id)
  #should ensure_inclusion_of(:id).in_range(1..100)
end
