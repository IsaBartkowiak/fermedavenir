# == Schema Information
#
# Table name: plants
#
#  id              :integer          not null, primary key
#  titre           :string
#  variete         :string
#  caracteristique :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  price           :float
#  farm_id         :integer
#  nb_per_kilo     :float            default(1000.0)
#

class Plant < ActiveRecord::Base
  has_many   :generations, dependent: :destroy
  has_many   :portions, dependent: :destroy
  belongs_to :farm

	amoeba do
		enable
	end
end
