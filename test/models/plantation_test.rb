# == Schema Information
#
# Table name: plantations
#
#  id            :integer          not null, primary key
#  farm_id       :integer
#  generation_id :integer
#  quantity      :float
#  year          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class PlantationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
