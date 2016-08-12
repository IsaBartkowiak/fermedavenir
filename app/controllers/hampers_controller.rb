# == Schema Information
#
# Table name: hampers
#
#  id         :integer          not null, primary key
#  semaine    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  farm_id    :integer
#  quantity   :integer          default(20)
#

class HampersController < ApplicationController
  before_action :check_user
  before_action :set_farm
  before_action :set_hamper, only: [:show, :edit, :update, :destroy]
  before_action :set_generations, only: [:edit, :update, :new]

  # GET /hampers
  # GET /hampers.json
  def index
    @hampers = @farm.hampers.par_semaines
  end

  # GET /hampers/1
  # GET /hampers/1.json
  def show
  end

  # GET /hampers/new
  def new
    @hamper = Hamper.new
  end

  # GET /hampers/1/edit
  def edit
  end

  # POST /hampers
  # POST /hampers.json
  def create
    @hamper = @farm.hampers.new(hamper_params)

    respond_to do |format|
      if @hamper.save
        format.html { redirect_to farm_hampers_path(@farm.slug), notice: 'Vous avez bien créé un nouveau hamper.' }
        format.json { render :show, status: :created, location: @farm.slug }
      else
        format.html { render :new }
        format.json { render json: @hamper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hampers/1
  # PATCH/PUT /hampers/1.json
  def update
    respond_to do |format|
      if @hamper.update(hamper_params)
        format.html { redirect_to farm_hamper_path(@farm.slug, @hamper), notice: 'Hamper mis à jour.' }
        format.json { render :show, status: :ok, location: @hamper }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @hamper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hampers/1
  # DELETE /hampers/1.json
  def destroy
    @hamper.destroy
    respond_to do |format|
      format.html { redirect_to farm_hampers_url(@farm.slug), notice: 'Hamper was successfully destroyed.' }
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
    def set_hamper
      @hamper = @farm.hampers.find(params[:id])
      @portions = @hamper.portions.all
    end

    def set_generations
      @generations = Generation.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def hamper_params
      params.require(:hamper).permit(:semaine, :quantity)
    end
end
