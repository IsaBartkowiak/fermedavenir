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
#  latitude   :float
#  longitude  :float
#

class Farm < ActiveRecord::Base
  include Slugify

  has_many :users
  has_many :plots
  has_many :hampers, dependent: :destroy
  has_many :plantations, dependent: :destroy
  has_many :plants, dependent: :destroy

  has_many :generations, through: :plants
  has_many :portions, through: :hampers
  has_many :generations_to_plant, -> { uniq }, through: :portions, source: :generation
  has_many :planted_generations, -> { uniq }, through: :plantations, source: :generation

  before_create :generate_hampers
  before_create :generate_plants

  # XXX FIXME Deux fermes devraient pouvoir avoir le même nom
  validates :name, uniqueness: true

  def get_quantity_to_plant a_generation
    quantity = 0
    portions.each do |portion|
      if portion.generation == a_generation
        quantity += (portion.quantity*portion.hamper.quantity)
    	end
    end
    quantity*a_generation.plant.nb_per_kilo 
  end

  def copy_leg(a_plant)
    plants << a_plant.amoeba_dup
  end

  def toggle_tutorials
    self.tutorial = !tutorial
    save
  end

  def is_drawn?
    !latitude.nil?
  end
  
  def to_s
    "#{name}"
  end

  private

  def generate_hampers
    for i in 1..52
      hampers.build(week: i)
    end
  end

  def generate_plants
    all_plants = Plant.where(farm_id: nil).all
    all_plants.each do |a_plant|
      copy_leg(a_plant)
    end
  end
end
