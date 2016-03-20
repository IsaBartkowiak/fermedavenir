# == Schema Information
#
# Table name: legumes
#
#  id              :integer          not null, primary key
#  titre           :string
#  variete         :string
#  caracteristique :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  price           :float
#

class Legume < ActiveRecord::Base
	has_many :generations
	belongs_to :farm

	amoeba do
		enable
	end
end
