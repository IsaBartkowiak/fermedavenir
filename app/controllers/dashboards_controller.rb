class DashboardsController < ApplicationController
  before_action :set_farm
  def index
  end

  private

  def set_farm
    @farm = current_user.farm unless current_user.nil?
  end
end
