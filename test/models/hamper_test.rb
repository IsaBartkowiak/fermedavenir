# == Schema Information
#
# Table name: hampers
#
#  id         :integer          not null, primary key
#  week       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  farm_id    :integer
#  quantity   :integer          default(20)
#

require 'test_helper'

class HamperTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
