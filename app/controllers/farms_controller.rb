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
#

class FarmsController < ApplicationController
  before_action :set_farm, only: [:show, :edit, :update, :destroy, :tutorial]
  before_action :check_user, except: [:index, :show]

  # GET /farms
  # GET /farms.json
  def index
    @farms = Farm.all
  end

  # GET /farms/1
  # GET /farms/1.json
  def show
    # redirect_to edit_farm_path(@farm.slug) unless @farm.is_drawn?
  end

  # GET /farms/new
  def new
    @farm = Farm.new
  end

  # GET /farms/1/edit
  def edit
  end

  # PATCH /:farm/tutorial
  def tutorial
    @farm.toggle_tutorials
    redirect_to :back
  end

  # POST /farms
  # POST /farms.json
  def create
    @farm = Farm.new(farm_params)
    @farm.users << current_user

    respond_to do |format|
      if @farm.save
        format.html { redirect_to root_path, notice: 'Votre ferme a été créée !' }
        format.json { render :show, status: :created, location: @farm }
      else
        format.html { redirect_to root_path, notice: 'Ce nom est probablement déjà pris' }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farms/1
  # PATCH/PUT /farms/1.json
  def update
    respond_to do |format|
      if @farm.update(farm_params)
        format.html { redirect_to farm_path(@farm.slug), notice: 'Votre ferme a été mise à jour.' }
        format.json { render :show, status: :ok, location: @farm }
      else
        format.html { render :edit }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farms/1
  # DELETE /farms/1.json
  def destroy
    @farm.destroy
    respond_to do |format|
      format.html { redirect_to farms_url, notice: 'Farm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def check_user
      redirect_to root_path unless current_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_farm
      @farm = current_user.farm
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def farm_params
      params.require(:farm).permit(:name, :location, :lat, :lng)
    end
end
