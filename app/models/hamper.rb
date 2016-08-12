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

class Hamper < ActiveRecord::Base
	has_many   :portions
	belongs_to :farm
	scope      :per_weeks, -> { order(week: :asc).all }

	def planted?
		portions.each do |portion|
			return false if !farm.plantations.exists?(generation: portion.generation)
		end
		true
	end

	def self.to_do(farm)
		total = 0
		Hamper.where(farm: farm).each do |hamper|
			total += 1 unless hamper.portions.any?
		end
		total
	end
end
