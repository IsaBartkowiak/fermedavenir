# == Schema Information
#
# Table name: paniers
#
#  id         :integer          not null, primary key
#  semaine    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Panier < ActiveRecord::Base
	has_many :portions
	belongs_to :user
	scope :par_semaines, -> {
		order(semaine: :asc).all
	}

	def self.generate_sample
		for i in 1..52
	      new(semaine: i).save unless find_by_semaine i 
	    end
	end
end
