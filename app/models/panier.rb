# == Schema Information
#
# Table name: paniers
#
#  id         :integer          not null, primary key
#  semaine    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  farm_id    :integer
#

class Panier < ActiveRecord::Base
	has_many :portions
	belongs_to :farm
	scope :par_semaines, -> {
		order(semaine: :asc).all
	}

	def planted?
		portions.each do |portion|
			return false if !farm.plantations.exists?(generation: portion.generation)
		end
		true
	end
end
