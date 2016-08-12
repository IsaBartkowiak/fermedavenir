# == Schema Information
#
# Table name: portions
#
#  id            :integer          not null, primary key
#  hamper_id     :integer
#  plant_id      :integer
#  generation_id :integer
#  quantity      :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Portion < ActiveRecord::Base
  belongs_to :plant
  belongs_to :generation
  belongs_to :hamper

  before_save :assign_generation

  def price
    plant.price.to_f*quantity.to_f unless plant.price.nil?
  end

  def refresh params
    self.quantity += params[:quantity].to_f
  end

  private 

  def assign_generation
    self.generation = Generation.where(plant: plant).available_for(hamper.semaine).first
    return false if generation.nil?
  end

end
