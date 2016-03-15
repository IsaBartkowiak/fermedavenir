# == Schema Information
#
# Table name: generations
#
#  id              :integer          not null, primary key
#  semi_from       :integer
#  semi_to         :integer
#  plantation      :integer
#  recolte         :integer
#  conservation_to :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  legume_id       :integer
#

class Generation < ActiveRecord::Base
	belongs_to :legume
end
