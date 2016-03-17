class StaticsController < ApplicationController
  def index
    @farm = Farm.new
  	redirect_to farm_paniers_path(current_user.farm.slug) if current_user && current_user.farm
  end
end
