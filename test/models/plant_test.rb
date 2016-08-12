# == Schema Information
#
# Table name: plants
#
#  id              :integer          not null, primary key
#  titre           :string
#  variete         :string
#  caracteristique :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  price           :float
#  farm_id         :integer
#  nb_per_kilo     :float            default(1000.0)
#

require 'test_helper'

class PlantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
