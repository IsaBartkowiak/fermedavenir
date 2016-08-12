class PortionsController < ApplicationController
  before_action :check_user
  before_action :set_farm
  before_action :set_portion, only: [:show, :edit, :update, :destroy]
  before_action :set_hamper

  # GET /portions
  # GET /portions.json
  def index
    @portions = @hamper.portions.all
    @generations = @farm.generations.available_for(@hamper.semaine)
    @portion = Portion.new
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
    identical_portions = @hamper.portions.where(generation_id: portion_params[:generation_id])

    if identical_portions.any?
      @portion = identical_portions.first
      @portion.refresh(portion_params)
    else
      @portion = @hamper.portions.new(portion_params)
    end

    respond_to do |format|
      if @portion.save
        format.html { redirect_to hamper_portions_url(@hamper), notice: "#{@portion.quantity} #{@portion.plant.titre} ajoutés au hamper" }
        format.json { render :show, status: :created, location: @hamper }
        format.js {}
      else
        format.html { redirect_to new_hamper_portion_path(@hamper), notice: "Pas de portions de #{@portion.plant.titre} disponible à cette date." }
        format.json { render json: @portion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portions/1
  # PATCH/PUT /portions/1.json
  def update
    respond_to do |format|
      if @portion.update(portion_params)
        format.html { redirect_to hamper_portions_url(@hamper), notice: 'Cette portion a été mise à jour.' }
        format.json { render :show, status: :ok, location: @portion }
      else
        format.html { redirect_to edit_hamper_portion_path(@hamper), notice: "Pas de portions de #{@portion.plant.titre} disponible à cette date." }
        format.json { render json: @portion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portions/1
  # DELETE /portions/1.json
  def destroy
    @portion.destroy
    respond_to do |format|
      format.html { redirect_to farm_hamper_portions_url(@hamper.farm, @hamper), notice: 'Le légume a été retiré avec succès' }
      format.json { head :no_content }
      format.js {}
    end
  end

  private

    def check_user
      redirect_to root_path, notice: 'Vous devez être connecté' if current_user.nil?
    end

    def set_farm
      @farm = current_user.farm
    end

    def set_hamper
      @hamper = Hamper.find(params[:hamper_id]) if params[:hamper_id]
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_portion
      @portion = Portion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portion_params
      params.require(:portion).permit(:hamper_id, :plant_id, :quantity, :generation_id)
    end
end
