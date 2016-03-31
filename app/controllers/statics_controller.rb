class StaticsController < ApplicationController
  def index
    @farm = Farm.new
  	redirect_to dashboard_path if current_user && current_user.farm
  end
end
