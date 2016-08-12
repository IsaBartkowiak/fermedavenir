# == Schema Information
#
# Table name: plots
#
#  id            :integer          not null, primary key
#  location      :string
#  generation_id :integer
#  farm_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  name          :string
#

require 'test_helper'

class PlotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
