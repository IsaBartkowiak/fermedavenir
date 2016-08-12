# == Schema Information
#
# Table name: generations
#
#  id            :integer          not null, primary key
#  seedling_from :integer          default(0)
#  seedling_to   :integer          default(0)
#  plantation    :integer
#  harvest       :integer
#  available_for :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  plant_id      :integer
#  farm_id       :integer
#

require 'test_helper'

class GenerationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
