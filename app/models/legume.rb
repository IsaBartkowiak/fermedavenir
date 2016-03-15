# == Schema Information
#
# Table name: legumes
#
#  id               :integer          not null, primary key
#  titre            :string
#  variete          :string
#  caracteristique  :string
#  semi_deb         :integer
#  semi_fin         :integer
#  temps_pousse_min :integer
#  temps_pousse_max :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Legume < ActiveRecord::Base
	has_many :generations
end
