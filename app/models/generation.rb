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

class Generation < ActiveRecord::Base
	belongs_to :legume

	def self.available_for(a_week)
		where("recolte <= ?", a_week).where("conservation_to <= ?", a_week)
	end
end
