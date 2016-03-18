# == Schema Information
#
# Table name: generations
#
#  id              :integer          not null, primary key
#  semi_from       :integer          default(0)
#  semi_to         :integer          default(0)
#  plantation      :integer
#  recolte         :integer
#  conservation_to :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  legume_id       :integer
#

class GenerationsController < ApplicationController
  before_action :set_generation, only: [:show, :edit, :update, :destroy]
  before_action :check_user
  before_action :bump, except: [:show, :index]

  # GET /generations
  # GET /generations.json
  def index
    @generations = Generation.all.order(plantation: :asc)
  end

  # GET /generations/1
  # GET /generations/1.json
  def show
  end

  # GET /generations/new
  def new
    @generation = Generation.new
  end

  # GET /generations/1/edit
  def edit
  end

  # POST /generations
  # POST /generations.json
  def create
    @generation = Generation.new(generation_params)

    respond_to do |format|
      if @generation.save
        format.html { redirect_to @generation, notice: 'Generation was successfully created.' }
        format.json { render :show, status: :created, location: @generation }
      else
        format.html { render :new }
        format.json { render json: @generation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generations/1
  # PATCH/PUT /generations/1.json
  def update
    respond_to do |format|
      if @generation.update(generation_params)
        format.html { redirect_to @generation, notice: 'Generation was successfully updated.' }
        format.json { render :show, status: :ok, location: @generation }
      else
        format.html { render :edit }
        format.json { render json: @generation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generations/1
  # DELETE /generations/1.json
  def destroy
    @generation.destroy
    respond_to do |format|
      format.html { redirect_to generations_url, notice: 'Generation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def check_user
      redirect_to root_path, notice: 'Vous devez être connecté' if current_user.nil?
    end

    def bump
      redirect_to root_path, notice: 'Vous devez être administrateur' unless current_user.statut == 'admin'
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_generation
      @generation = Generation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def generation_params
      params.require(:generation).permit(:semi_from, :semi_to, :plantation, :recolte, :conservation_from, :conservation_to, :legume_id)
    end
end
