class LegumesController < ApplicationController
  before_action :set_legume, only: [:show, :edit, :update, :destroy]

  # GET /legumes
  # GET /legumes.json
  def index
    @legumes = Legume.all
  end

  # GET /legumes/1
  # GET /legumes/1.json
  def show
  end

  # GET /legumes/new
  def new
    @legume = Legume.new
  end

  # GET /legumes/1/edit
  def edit
  end

  # POST /legumes
  # POST /legumes.json
  def create
    @legume = Legume.new(legume_params)

    respond_to do |format|
      if @legume.save
        format.html { redirect_to @legume, notice: 'Legume was successfully created.' }
        format.json { render :show, status: :created, location: @legume }
      else
        format.html { render :new }
        format.json { render json: @legume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legumes/1
  # PATCH/PUT /legumes/1.json
  def update
    respond_to do |format|
      if @legume.update(legume_params)
        format.html { redirect_to @legume, notice: 'Legume was successfully updated.' }
        format.json { render :show, status: :ok, location: @legume }
      else
        format.html { render :edit }
        format.json { render json: @legume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legumes/1
  # DELETE /legumes/1.json
  def destroy
    @legume.destroy
    respond_to do |format|
      format.html { redirect_to legumes_url, notice: 'Legume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legume
      @legume = Legume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legume_params
      params.require(:legume).permit(:titre, :variete, :type, :semi_deb, :semi_fin, :temps_pousse_min, :temps_pousse_max)
    end
end
