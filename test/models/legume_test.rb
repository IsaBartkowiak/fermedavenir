# == Schema Information
#
# Table name: legumes
#
#  id               :integer          not null, primary key
#  titre            :string
#  variete          :string
#  caracteristique  :string
#  semi_deb         :integer
#  semi_fin         :integer
#  temps_pousse_min :integer
#  temps_pousse_max :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class LegumeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
