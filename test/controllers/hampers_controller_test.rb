# == Schema Information
#
# Table name: hampers
#
#  id         :integer          not null, primary key
#  semaine    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  farm_id    :integer
#  quantity   :integer          default(20)
#

require 'test_helper'

class HampersControllerTest < ActionController::TestCase
  setup do
    @hamper = hampers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hampers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hamper" do
    assert_difference('Hamper.count') do
      post :create, hamper: { semaine: @hamper.semaine }
    end

    assert_redirected_to hamper_path(assigns(:hamper))
  end

  test "should show hamper" do
    get :show, id: @hamper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hamper
    assert_response :success
  end

  test "should update hamper" do
    patch :update, id: @hamper, hamper: { semaine: @hamper.semaine }
    assert_redirected_to hamper_path(assigns(:hamper))
  end

  test "should destroy hamper" do
    assert_difference('Hamper.count', -1) do
      delete :destroy, id: @hamper
    end

    assert_redirected_to hampers_path
  end
end
