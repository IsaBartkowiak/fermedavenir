# == Schema Information
#
# Table name: portions
#
#  id            :integer          not null, primary key
#  hamper_id     :integer
#  legume_id     :integer
#  generation_id :integer
#  quantity      :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class PortionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
