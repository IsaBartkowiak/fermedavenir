# == Schema Information
#
# Table name: generations
#
#  id              :integer          not null, primary key
#  semi_from       :integer          default(0)
#  semi_to         :integer          default(0)
#  plantation      :integer
#  recolte         :integer
#  conservation_to :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  legume_id       :integer
#

require 'test_helper'

class GenerationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
