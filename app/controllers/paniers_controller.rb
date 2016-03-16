# == Schema Information
#
# Table name: paniers
#
#  id         :integer          not null, primary key
#  semaine    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PaniersController < ApplicationController
  before_action :set_panier, only: [:show, :edit, :update, :destroy]
  before_action :set_generations, only: [:edit, :update, :new]
  before_action :check_user

  # GET /paniers
  # GET /paniers.json
  def index
    @paniers = Panier.par_semaines
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
    @panier = Panier.new(panier_params)

    respond_to do |format|
      if @panier.save
        format.html { redirect_to @panier, notice: 'Panier was successfully created.' }
        format.json { render :show, status: :created, location: @panier }
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
        format.html { redirect_to @panier, notice: 'Panier was successfully updated.' }
        format.json { render :show, status: :ok, location: @panier }
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
      format.html { redirect_to paniers_url, notice: 'Panier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def check_user
      redirect_to root_path, notice: 'Vous devez être connecté' if current_user.nil?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_panier
      @panier = Panier.find(params[:id])
      @portions = @panier.portions.all
    end

    def set_generations
      @generations = Generation.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def panier_params
      params.require(:panier).permit(:semaine)
    end
end
