# == Schema Information
#
# Table name: plantations
#
#  id            :integer          not null, primary key
#  farm_id       :integer
#  generation_id :integer
#  quantity      :float
#  year          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PlantationsController < ApplicationController
  before_action :set_farm
  before_action :set_plantation, only: [:show, :edit, :update, :destroy]

  # GET /plantations
  # GET /plantations.json
  def index
    @plantations = @farm.plantations.all
    @generations = @farm.get_generations_to_plant

    redirect_to farm_paniers_path(@farm), notice: "Vous n'avez pas encore constitué vos paniers, remplissez-les afin de pouvoir accéder à vos plantations ;-)" if @generations.count == 0

    @plantation = Plantation.new
  end

  # GET /plantations/1
  # GET /plantations/1.json
  def show
  end

  # GET /plantations/new
  def new
    @plantation = Plantation.new
  end

  # GET /plantations/1/edit
  def edit
  end

  # POST /plantations
  # POST /plantations.json
  def create
    @plantation = @farm.plantations.new(plantation_params)

    respond_to do |format|
      if @plantation.save
        format.html { redirect_to farm_plantations_path(@farm), notice: 'Vous avez bien planté ce légume.' }
        format.json { render :show, status: :created, location: @plantation }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @plantation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plantations/1
  # PATCH/PUT /plantations/1.json
  def update
    respond_to do |format|
      if @plantation.update(plantation_params)
        format.html { redirect_to farm_plantations_path(@farm), notice: 'Plantation was successfully updated.' }
        format.json { render :show, status: :ok, location: @plantation }
      else
        format.html { render :edit }
        format.json { render json: @plantation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plantations/1
  # DELETE /plantations/1.json
  def destroy
    @plantation.destroy
    respond_to do |format|
      format.html { redirect_to farm_plantations_url(@farm), notice: 'Plantation enlevée.' }
      format.json { head :no_content }
    end
  end

  private
    def set_farm
      @farm = Farm.find_by_slug(params[:farm_slug])
      @farm ||= Farm.find(params[:farm_slug])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_plantation
      @plantation = @farm.plantations.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plantation_params
      params.require(:plantation).permit(:farm_id, :generation_id, :quantity, :year)
    end
end
