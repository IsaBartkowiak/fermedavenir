# == Schema Information
#
# Table name: legumes
#
#  id              :integer          not null, primary key
#  titre           :string
#  variete         :string
#  caracteristique :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  price           :float
#

class LegumesController < ApplicationController
  before_action :set_farm
  before_action :check_user
  before_action :set_legume, only: [:show, :edit, :update, :destroy]

  # GET /legumes
  # GET /legumes.json
  def index
    @legumes = @farm.legumes.all
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
    @legume = @farm.legumes.new(legume_params)

    respond_to do |format|
      if @legume.save
        format.html { redirect_to legumes_path, notice: "Vous avez bien ajouté un(e) #{@legume.titre}" }
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
        format.html { redirect_to legumes_path, notice: 'Ce légume a été mis à jour' }
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
    def check_user
      redirect_to root_path, notice: 'Vous devez être connecté' if current_user.nil?
    end

    def set_farm
      @farm = current_user.farm
    end

    def set_legume
      @legume = @farm.legumes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legume_params
      params.require(:legume).permit(:titre, :variete, :caracteristique, :price, :nb_per_kilo)
    end
end
