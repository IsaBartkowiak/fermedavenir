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

class Plantation < ActiveRecord::Base
  belongs_to :farm
  belongs_to :generation

  def is_planted 
  	
  end
end
