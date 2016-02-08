require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { MFUPC: @product.MFUPC, avail_min_qty: @product.avail_min_qty, buffer_stock: @product.buffer_stock, company: @product.company, cost_price: @product.cost_price, depth: @product.depth, height: @product.height, is_sample: @product.is_sample, merchant: @product.merchant, name: @product.name, retail_price: @product.retail_price, sku: @product.sku, storage_type: @product.storage_type, weight: @product.weight, width: @product.width }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product, product: { MFUPC: @product.MFUPC, avail_min_qty: @product.avail_min_qty, buffer_stock: @product.buffer_stock, company: @product.company, cost_price: @product.cost_price, depth: @product.depth, height: @product.height, is_sample: @product.is_sample, merchant: @product.merchant, name: @product.name, retail_price: @product.retail_price, sku: @product.sku, storage_type: @product.storage_type, weight: @product.weight, width: @product.width }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
