class StaticsController < ApplicationController
  def index
  	redirect_to paniers_path if current_user
  end
end
