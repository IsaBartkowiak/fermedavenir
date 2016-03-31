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

	scope :per_plantation_date, -> {
		order(plantation: :asc)
	}
  scope :to_plant_this_week, -> {
    where("plantation = ?", Date.today.cweek).per_plantation_date
  }
  scope :to_sem_this_week, -> {
    where("semi_from <= ?", Date.today.cweek).where("semi_to >= ?", Date.today.cweek).per_plantation_date
  }
  scope :to_recolt_this_week, -> {
    where("recolte = ?", Date.today.cweek).per_plantation_date
  }

	def self.available_for(a_week)
		where("recolte <= ?", a_week).where("conservation_to >= ?", a_week).per_plantation_date
	end
end
