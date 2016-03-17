# == Schema Information
#
# Table name: farms
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Farm < ActiveRecord::Base
	validates :name, uniqueness: true
	has_many :users
	before_save :generate_paniers
	before_save :create_slug
	has_many :paniers
	has_many :plantations


	private

  def generate_paniers
  	for i in 1..52
			paniers.build(semaine: i)
	  end
  end

  def create_slug
  	self.slug = name.parameterize
  end
end
