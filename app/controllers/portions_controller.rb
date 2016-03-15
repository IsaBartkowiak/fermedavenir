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

class PortionsController < ApplicationController
  before_action :set_portion, only: [:show, :edit, :update, :destroy]
  before_action :set_panier

  # GET /portions
  # GET /portions.json
  def index
    @portions = Portion.all
  end

  # GET /portions/1
  # GET /portions/1.json
  def show
  end

  # GET /portions/new
  def new
    @portion = Portion.new
  end

  # GET /portions/1/edit
  def edit
  end

  # POST /portions
  # POST /portions.json
  def create
    @portion = @panier.portions.new(portion_params)

    respond_to do |format|
      if @portion.save
        format.html { redirect_to panier_portions_url(@panier), notice: 'Portion was successfully created.' }
        format.json { render :show, status: :created, location: @panier }
      else
        format.html { redirect_to panier_portions_url(@panier), notice: "Pas de portions de #{@portion.legume.titre} disponible." }
        format.json { render json: @portion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portions/1
  # PATCH/PUT /portions/1.json
  def update
    respond_to do |format|
      if @portion.update(portion_params)
        format.html { redirect_to panier_portions_url(@panier), notice: 'Portion was successfully updated.' }
        format.json { render :show, status: :ok, location: @portion }
      else
        format.html { redirect_to panier_portions_url(@panier), notice: "Pas de portions de #{@portion.legume.titre} disponible." }
        format.json { render json: @portion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portions/1
  # DELETE /portions/1.json
  def destroy
    @portion.destroy
    respond_to do |format|
      format.html { redirect_to panier_portions_url(@panier), notice: 'Portion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_panier
      @panier = Panier.find(params[:panier_id]) if params[:panier_id]
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_portion
      @portion = Portion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portion_params
      params.require(:portion).permit(:panier_id, :legume_id, :quantity)
    end
end
