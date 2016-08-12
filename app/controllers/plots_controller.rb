# == Schema Information
#
# Table name: plots
#
#  id            :integer          not null, primary key
#  location      :string
#  generation_id :integer
#  farm_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string
#

class PlotsController < ApplicationController
  before_action :set_farm
  before_action :set_plot, only: [:show, :edit, :update, :destroy]

  # GET /plots
  # GET /plots.json
  def index
    @plots = @farm.plots.all
  end

  # GET /plots/1
  # GET /plots/1.json
  def show
  end

  # GET /plots/new
  def new
    @plants = @farm.plants.all
    @plot = Plot.new
  end

  # GET /plots/1/edit
  def edit
  end

  # POST /plots
  # POST /plots.json
  def create
    @plot = @farm.plots.new(plot_params)

    respond_to do |format|
      if @plot.save
        format.html { redirect_to @farm, notice: 'Plot ajoutée.' }
        format.json { render :show, status: :created, location: @farm }
      else
        format.html { render :new }
        format.json { render json: @plot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plots/1
  # PATCH/PUT /plots/1.json
  def update
    respond_to do |format|
      if @plot.update(plot_params)
        format.html { redirect_to @farm, notice: 'Plot mise à jour.' }
        format.json { render :show, status: :ok, location: @farm }
      else
        format.html { render :edit }
        format.json { render json: @plot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plots/1
  # DELETE /plots/1.json
  def destroy
    @plot.destroy
    respond_to do |format|
      format.html { redirect_to @farm, notice: 'Plot supprimée.' }
      format.json { head :no_content }
    end
  end

  private

    def set_farm
      @farm = current_user.farm
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_plot
      @plot = @farm.plots.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def plot_params
      params.require(:plot).permit(:location, :generation_id, :farm_id, :name)
    end
end
