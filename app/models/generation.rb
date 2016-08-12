# == Schema Information
#
# Table name: generations
#
#  id            :integer          not null, primary key
#  seedling_from :integer          default(0)
#  seedling_to   :integer          default(0)
#  plantation    :integer
#  harvest       :integer
#  available_for :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  plant_id      :integer
#  farm_id       :integer
#

class Generation < ActiveRecord::Base
  scope :per_plantation_date, -> { order(plantation: :asc) }
  scope :to_plant_this_week,  -> { where("plantation = ?", Date.today.cweek).per_plantation_date }
  scope :to_sem_this_week,    -> { where("seedling_from <= ?", Date.today.cweek).where("seedling_to >= ?", Date.today.cweek).per_plantation_date }
  scope :to_recolt_this_week, -> { where("harvest = ?", Date.today.cweek).per_plantation_date }

	belongs_to :plant

	def self.available_for(a_week)
		where("harvest <= ?", a_week).where("available_for >= ?", a_week).per_plantation_date
	end
end
