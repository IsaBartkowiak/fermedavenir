# == Schema Information
#
# Table name: plantations
#
#  id            :integer          not null, primary key
#  farm_id       :integer          not null
#  generation_id :integer          not null
#  quantity      :float
#  year          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Plantation < ActiveRecord::Base
  belongs_to :farm
  belongs_to :generation

  validates :farm, :generation, presence: true
end
