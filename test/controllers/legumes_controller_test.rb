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
#

require 'test_helper'

class LegumesControllerTest < ActionController::TestCase
  setup do
    @legume = legumes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:legumes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create legume" do
    assert_difference('Legume.count') do
      post :create, legume: { semi_deb: @legume.semi_deb, semi_fin: @legume.semi_fin, temps_pousse_max: @legume.temps_pousse_max, temps_pousse_min: @legume.temps_pousse_min, titre: @legume.titre, type: @legume.type, variete: @legume.variete }
    end

    assert_redirected_to legume_path(assigns(:legume))
  end

  test "should show legume" do
    get :show, id: @legume
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @legume
    assert_response :success
  end

  test "should update legume" do
    patch :update, id: @legume, legume: { semi_deb: @legume.semi_deb, semi_fin: @legume.semi_fin, temps_pousse_max: @legume.temps_pousse_max, temps_pousse_min: @legume.temps_pousse_min, titre: @legume.titre, type: @legume.type, variete: @legume.variete }
    assert_redirected_to legume_path(assigns(:legume))
  end

  test "should destroy legume" do
    assert_difference('Legume.count', -1) do
      delete :destroy, id: @legume
    end

    assert_redirected_to legumes_path
  end
end
