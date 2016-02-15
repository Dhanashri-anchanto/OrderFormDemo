class CustomersController < ApplicationController
# GET /customers
# GET /customers.json
def index
  @customers = Customer.all

  respond_to do |format|
format.html # index.html.erb
format.json { render json: @customers }
end
end

# GET /customers/1
# GET /customers/1.json
def show

  if request.xhr?
    @customer = Customer.find_by_email(params[:email])
  else
    @customer = Customer.find(params[:id])  #Customer.includes(:addresses).find(params[:id])
    @addresses = @customer.addresses
  end
respond_to do |format|
format.html # show.html.erb
format.json { render json: @customer }
end
end

# GET /customers/new
# GET /customers/new.json
def new
  @customer = Customer.new
  @address = @customer.addresses.new
 # @order = @customer.orders.new

  respond_to do |format|
format.html # new.html.erb
format.json { render json: @customer }
end
end

def customer_details  
  @customer = Customer.find_by_email(params[:email])
  respond_to do |format|
format.html # show.html.erb
format.json { render json: @customer }
end
end


def customer_address

  @customer = Customer.find_by_email(params[:email])
  #@id = @customer.id
  @add = @customer.addresses
  respond_to do |format|
format.html # show.html.erb
format.json { render json: @add }

end
end
# GET /customers/1/edit
def edit
  @customer = Customer.find(params[:id])

end

# POST /customers
# POST /customers.json
def create
  #raise params.inspect
  
  @customer = Customer.new(params[:customer])
  #@customer.addresses.build
# @customer.order.build
if Customer.where(email: @customer.email).empty?
  respond_to do |format|
    if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
    else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
    end
  end
else
  flash[:notice] = 'Customer already Exists'
  render action: "new" , flash: {notice: "Customer already Exists"} 

end
end
# end

# PUT /customers/1
# PUT /customers/1.json
def update
  @customer = Customer.find(params[:id])

  respond_to do |format|
    if @customer.update_attributes(params[:customer])
      format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @customer.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /customers/1
# DELETE /customers/1.json
def destroy
  @customer = Customer.find(params[:id])
  @customer.destroy

  respond_to do |format|
    format.html { redirect_to customers_url }
    format.json { head :no_content }
  end
end
end
