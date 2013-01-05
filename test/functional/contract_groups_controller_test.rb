require 'test_helper'

class ContractGroupsControllerTest < ActionController::TestCase
  setup do
    @contract_group = contract_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contract_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contract_group" do
    assert_difference('ContractGroup.count') do
      post :create, contract_group: { file: @contract_group.file, group_name: @contract_group.group_name }
    end

    assert_redirected_to contract_group_path(assigns(:contract_group))
  end

  test "should show contract_group" do
    get :show, id: @contract_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contract_group
    assert_response :success
  end

  test "should update contract_group" do
    put :update, id: @contract_group, contract_group: { file: @contract_group.file, group_name: @contract_group.group_name }
    assert_redirected_to contract_group_path(assigns(:contract_group))
  end

  test "should destroy contract_group" do
    assert_difference('ContractGroup.count', -1) do
      delete :destroy, id: @contract_group
    end

    assert_redirected_to contract_groups_path
  end
end
