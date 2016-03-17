# == Schema Information
#
# Table name: paniers
#
#  id         :integer          not null, primary key
#  semaine    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  farm_id    :integer
#  quantity   :integer          default(20)
#

class PaniersController < ApplicationController
  before_action :check_user
  before_action :set_farm
  before_action :set_panier, only: [:show, :edit, :update, :destroy]
  before_action :set_generations, only: [:edit, :update, :new]

  # GET /paniers
  # GET /paniers.json
  def index
    @paniers = @farm.paniers.par_semaines
  end

  # GET /paniers/1
  # GET /paniers/1.json
  def show
  end

  # GET /paniers/new
  def new
    @panier = Panier.new
  end

  # GET /paniers/1/edit
  def edit
  end

  # POST /paniers
  # POST /paniers.json
  def create
    @panier = @farm.paniers.new(panier_params)

    respond_to do |format|
      if @panier.save
        format.html { redirect_to farm_panier_path(@farm.slug,@panier), notice: 'Panier was successfully created.' }
        format.json { render :show, status: :created, location: @farm.slug }
      else
        format.html { render :new }
        format.json { render json: @panier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paniers/1
  # PATCH/PUT /paniers/1.json
  def update
    respond_to do |format|
      if @panier.update(panier_params)
        format.html { redirect_to farm_panier_path(@farm.slug, @panier), notice: 'Panier was successfully updated.' }
        format.json { render :show, status: :ok, location: @panier }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @panier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paniers/1
  # DELETE /paniers/1.json
  def destroy
    @panier.destroy
    respond_to do |format|
      format.html { redirect_to farm_paniers_url(@farm.slug), notice: 'Panier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def check_user
      redirect_to root_path, notice: 'Vous devez être connecté' if current_user.nil?
    end

    def set_farm
      @farm = current_user.farm || Farm.find_by_slug(params[:farm_slug])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_panier
      @panier = @farm.paniers.find(params[:id])
      @portions = @panier.portions.all
    end

    def set_generations
      @generations = Generation.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def panier_params
      params.require(:panier).permit(:semaine, :quantity)
    end
end
