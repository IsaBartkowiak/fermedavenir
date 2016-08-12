# == Schema Information
#
# Table name: plants
#
#  id              :integer          not null, primary key
#  titre           :string
#  variete         :string
#  caracteristique :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  price           :float
#  farm_id         :integer
#  nb_per_kilo     :float            default(1000.0)
#

require 'test_helper'

class PlantsControllerTest < ActionController::TestCase
  setup do
    @plant = plants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plant" do
    assert_difference('Plant.count') do
      post :create, plant: { semi_deb: @plant.semi_deb, semi_fin: @plant.semi_fin, temps_pousse_max: @plant.temps_pousse_max, temps_pousse_min: @plant.temps_pousse_min, titre: @plant.titre, type: @plant.type, variete: @plant.variete }
    end

    assert_redirected_to plant_path(assigns(:plant))
  end

  test "should show plant" do
    get :show, id: @plant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plant
    assert_response :success
  end

  test "should update plant" do
    patch :update, id: @plant, plant: { semi_deb: @plant.semi_deb, semi_fin: @plant.semi_fin, temps_pousse_max: @plant.temps_pousse_max, temps_pousse_min: @plant.temps_pousse_min, titre: @plant.titre, type: @plant.type, variete: @plant.variete }
    assert_redirected_to plant_path(assigns(:plant))
  end

  test "should destroy plant" do
    assert_difference('Plant.count', -1) do
      delete :destroy, id: @plant
    end

    assert_redirected_to plants_path
  end
end
