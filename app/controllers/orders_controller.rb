class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @li = @order.line_items

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new
     @order.build_customer
     @order.build_address
    #@order.customer.new
  # @order.address.new
    #@order.customer.new
    #@order.addresse.new
    #@line_items = @order.line_items.new
    #@line_items = @order.line_items.new
    #@customer = Customer.first
    #@addresses = @customer.addresses

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    #raise params.inspect
    @order = Order.new(params[:order])


#    my_class = Customer.find_or_initialize_by_email(params[:customer])
#    puts "========#{my_class}"
#     my_class_one = Address.find_or_initialize_by_id(params[:address])

# my_class.update_attributes(
#   :email => my_class.email,
#   :first_name => my_class.first_name,
#   :last_name => my_class.last_name,
#   :mobile => my_class.mobile
  
# )
# my_class_one.update_attributes(
#   :street_no => my_class_one.street_no,
#   :street_name => my_class_one.street_name,
#   :area_name => my_class_one.area_name,
#   :landmark => my_class_one.landmark,
#   :city => my_class_one.city,
#   :postal_code => my_class_one.postal_code,
#   :state => my_class_one.state,
#   :country => my_class_one.country
  
# )
   # @order.customer.build
    #@order.address.build
    #Customer.first_or_create
    #Address.first_or_create

    # if Customer.where(email: @customer.email).empty?
    #       @order.customer.build
    #        @order.address.build    
    
    # else
      respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  #end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
