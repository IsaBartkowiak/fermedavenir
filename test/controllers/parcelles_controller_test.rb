# == Schema Information
#
# Table name: parcelles
#
#  id            :integer          not null, primary key
#  location      :string
#  generation_id :integer
#  farm_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string
#

require 'test_helper'

class ParcellesControllerTest < ActionController::TestCase
  setup do
    @parcelle = parcelles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parcelles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parcelle" do
    assert_difference('Parcelle.count') do
      post :create, parcelle: { generation_id: @parcelle.generation_id, location: @parcelle.location }
    end

    assert_redirected_to parcelle_path(assigns(:parcelle))
  end

  test "should show parcelle" do
    get :show, id: @parcelle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parcelle
    assert_response :success
  end

  test "should update parcelle" do
    patch :update, id: @parcelle, parcelle: { generation_id: @parcelle.generation_id, location: @parcelle.location }
    assert_redirected_to parcelle_path(assigns(:parcelle))
  end

  test "should destroy parcelle" do
    assert_difference('Parcelle.count', -1) do
      delete :destroy, id: @parcelle
    end

    assert_redirected_to parcelles_path
  end
end
