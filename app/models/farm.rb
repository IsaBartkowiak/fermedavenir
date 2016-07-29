# == Schema Information
#
# Table name: farms
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  location   :string
#  tutorial   :boolean          default(TRUE)
#  lat        :float
#  lng        :float
#

class Farm < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :users
  has_many :parcelles
  has_many :paniers, dependent: :destroy
  has_many :plantations, dependent: :destroy
  has_many :legumes, dependent: :destroy

  has_many :generations, through: :legumes
  has_many :portions, through: :paniers
  has_many :generations_to_plant, -> { uniq }, through: :portions, source: :generation
  has_many :planted_generations, -> { uniq }, through: :plantations, source: :generation

  before_create :generate_paniers
  before_create :generate_legumes
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

  def toggle_tutorials
    self.tutorial = !tutorial
    save
  end

  def is_drawn?
    !lat.nil?
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
