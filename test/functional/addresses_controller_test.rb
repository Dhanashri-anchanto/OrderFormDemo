require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post :create, address: { area_name: @address.area_name, city: @address.city, country: @address.country, customer_id: @address.customer_id, landmark: @address.landmark, postal_code: @address.postal_code, state: @address.state, street_name: @address.street_name, street_no: @address.street_no }
    end

    assert_redirected_to address_path(assigns(:address))
  end

  test "should show address" do
    get :show, id: @address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @address
    assert_response :success
  end

  test "should update address" do
    put :update, id: @address, address: { area_name: @address.area_name, city: @address.city, country: @address.country, customer_id: @address.customer_id, landmark: @address.landmark, postal_code: @address.postal_code, state: @address.state, street_name: @address.street_name, street_no: @address.street_no }
    assert_redirected_to address_path(assigns(:address))
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, id: @address
    end

    assert_redirected_to addresses_path
  end
end
