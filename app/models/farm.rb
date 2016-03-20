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
	has_many :paniers
	has_many :plantations
	has_many :legumes

	has_many :generations, through: :legumes
	has_many :portions, through: :paniers
	has_many :generations_to_plant, through: :portions, source: :generation

	before_save :generate_paniers
	before_save :generate_legumes
	before_save :create_slug

	def get_quantity_to_plant a_generation
		quantity = 0
		portions.each do |portion|
      if portion.generation == a_generation
      	quantity += (portion.quantity*portion.panier.quantity)
      end
    end
		quantity*a_generation.legume.nb_per_kilo 
	end

  def copy_leg(a_legume)
  	legumes << a_legume.amoeba_dup
  end

	private

  def generate_paniers
  	for i in 1..52
			paniers.build(semaine: i)
	  end
  end

  def generate_legumes
  	all_legumes = Legume.where(farm_id: nil).all
		all_legumes.each do |a_legume|
			copy_leg(a_legume)
		end
  end


  def create_slug
  	self.slug = name.parameterize
  end
end
