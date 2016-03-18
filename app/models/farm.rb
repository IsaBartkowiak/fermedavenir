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
	
	before_save :generate_paniers
	before_save :generate_legumes
	before_save :create_slug

	def get_generations_to_plant
		generations = []
		paniers.each do |panier|
      panier.portions.each do |portion|
        generations << portion.generation
      end
    end
    generations.sort_by{|g| g[:plantation]}
	end

	def get_quantity_to_plant a_generation
		quantity = 0
		paniers.each do |panier|
      panier.portions.each do |portion|
        if portion.generation == a_generation
        	quantity += (portion.quantity*panier.quantity)
        end
      end
    end
		quantity    
	end

	def get_generations
		generations = []
		legumes.each do |legume|
			legume.generations.each do |gen|
      	generations << gen unless generations.include?(gen)
      end
    end
    generations
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
