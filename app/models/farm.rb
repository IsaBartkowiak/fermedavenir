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
	has_many :users
	before_save :generate_paniers
	before_save :create_slug
	has_many :paniers


	private

  def generate_paniers
 		paniers.generate_sample
  end

  def create_slug
  	self.slug = name.parameterize
  end
end
