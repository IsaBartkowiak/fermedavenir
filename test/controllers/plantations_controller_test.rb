# == Schema Information
#
# Table name: plantations
#
#  id            :integer          not null, primary key
#  farm_id       :integer
#  generation_id :integer
#  quantity      :float
#  year          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class PlantationsControllerTest < ActionController::TestCase
  setup do
    @plantation = plantations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plantations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plantation" do
    assert_difference('Plantation.count') do
      post :create, plantation: { farm_id: @plantation.farm_id, generation_id: @plantation.generation_id, quantity: @plantation.quantity, year: @plantation.year }
    end

    assert_redirected_to plantation_path(assigns(:plantation))
  end

  test "should show plantation" do
    get :show, id: @plantation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plantation
    assert_response :success
  end

  test "should update plantation" do
    patch :update, id: @plantation, plantation: { farm_id: @plantation.farm_id, generation_id: @plantation.generation_id, quantity: @plantation.quantity, year: @plantation.year }
    assert_redirected_to plantation_path(assigns(:plantation))
  end

  test "should destroy plantation" do
    assert_difference('Plantation.count', -1) do
      delete :destroy, id: @plantation
    end

    assert_redirected_to plantations_path
  end
end
