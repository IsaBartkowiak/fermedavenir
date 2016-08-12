# == Schema Information
#
# Table name: portions
#
#  id            :integer          not null, primary key
#  panier_id     :integer
#  plant_id     :integer
#  generation_id :integer
#  quantity      :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class PortionsControllerTest < ActionController::TestCase
  setup do
    @portion = portions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create portion" do
    assert_difference('Portion.count') do
      post :create, portion: { generation_id: @portion.generation_id, plant_id: @portion.plant_id, panier_id: @portion.panier_id, quantity: @portion.quantity }
    end

    assert_redirected_to portion_path(assigns(:portion))
  end

  test "should show portion" do
    get :show, id: @portion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @portion
    assert_response :success
  end

  test "should update portion" do
    patch :update, id: @portion, portion: { generation_id: @portion.generation_id, plant_id: @portion.plant_id, panier_id: @portion.panier_id, quantity: @portion.quantity }
    assert_redirected_to portion_path(assigns(:portion))
  end

  test "should destroy portion" do
    assert_difference('Portion.count', -1) do
      delete :destroy, id: @portion
    end

    assert_redirected_to portions_path
  end
end
