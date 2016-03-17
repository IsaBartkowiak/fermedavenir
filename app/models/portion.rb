# == Schema Information
#
# Table name: portions
#
#  id            :integer          not null, primary key
#  panier_id     :integer
#  legume_id     :integer
#  generation_id :integer
#  quantity      :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Portion < ActiveRecord::Base
  belongs_to :legume
  belongs_to :generation
  belongs_to :panier

  before_save :assign_generation

  def price
	legume.price.to_f*quantity.to_f unless legume.price.nil?
  end

  private 

  def assign_generation
  	self.generation = Generation.where(legume: legume).available_for(panier.semaine).first
  	return false if generation.nil?
  end

end
