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
#  farm_id         :integer
#

require 'test_helper'

class GenerationsControllerTest < ActionController::TestCase
  setup do
    @generation = generations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:generations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create generation" do
    assert_difference('Generation.count') do
      post :create, generation: { conservation_to: @generation.conservation_to, plantation: @generation.plantation, recolte: @generation.recolte, semi_from: @generation.semi_from, semi_to: @generation.semi_to }
    end

    assert_redirected_to generation_path(assigns(:generation))
  end

  test "should show generation" do
    get :show, id: @generation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @generation
    assert_response :success
  end

  test "should update generation" do
    patch :update, id: @generation, generation: { conservation_to: @generation.conservation_to, plantation: @generation.plantation, recolte: @generation.recolte, semi_from: @generation.semi_from, semi_to: @generation.semi_to }
    assert_redirected_to generation_path(assigns(:generation))
  end

  test "should destroy generation" do
    assert_difference('Generation.count', -1) do
      delete :destroy, id: @generation
    end

    assert_redirected_to generations_path
  end
end
