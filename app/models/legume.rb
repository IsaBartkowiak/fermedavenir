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
#

class Legume < ActiveRecord::Base
	has_many :generations
end
