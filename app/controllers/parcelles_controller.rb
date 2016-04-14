# == Schema Information
#
# Table name: parcelles
#
#  id            :integer          not null, primary key
#  location      :string
#  generation_id :integer
#  farm_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string
#

class ParcellesController < ApplicationController
  before_action :set_farm
  before_action :set_parcelle, only: [:show, :edit, :update, :destroy]

  # GET /parcelles
  # GET /parcelles.json
  def index
    @parcelles = @farm.parcelles.all
  end

  # GET /parcelles/1
  # GET /parcelles/1.json
  def show
  end

  # GET /parcelles/new
  def new
    @legumes = @farm.legumes.all
    @parcelle = Parcelle.new
  end

  # GET /parcelles/1/edit
  def edit
  end

  # POST /parcelles
  # POST /parcelles.json
  def create
    @parcelle = @farm.parcelles.new(parcelle_params)

    respond_to do |format|
      if @parcelle.save
        format.html { redirect_to @farm, notice: 'Parcelle ajoutée.' }
        format.json { render :show, status: :created, location: @farm }
      else
        format.html { render :new }
        format.json { render json: @parcelle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parcelles/1
  # PATCH/PUT /parcelles/1.json
  def update
    respond_to do |format|
      if @parcelle.update(parcelle_params)
        format.html { redirect_to @farm, notice: 'Parcelle mise à jour.' }
        format.json { render :show, status: :ok, location: @farm }
      else
        format.html { render :edit }
        format.json { render json: @parcelle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parcelles/1
  # DELETE /parcelles/1.json
  def destroy
    @parcelle.destroy
    respond_to do |format|
      format.html { redirect_to @farm, notice: 'Parcelle supprimée.' }
      format.json { head :no_content }
    end
  end

  private

    def set_farm
      @farm = current_user.farm
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_parcelle
      @parcelle = @farm.parcelles.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def parcelle_params
      params.require(:parcelle).permit(:location, :generation_id, :farm_id, :title)
    end
end
