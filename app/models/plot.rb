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

class Plot < ActiveRecord::Base
  belongs_to :generation
  belongs_to :farm

  validates :farm, presence: true
end
