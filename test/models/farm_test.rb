# == Schema Information
#
# Table name: farms
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  location   :string
#  tutorial   :boolean          default(TRUE)
#

require 'test_helper'

class FarmTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
