class CustomersController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      redirect_to root_path, notice: "Customer has been created."
    else
      flash[:error] = "Customer could not be created"
      render :new
    end
  end

  def edit
    @customer = Customer.find_by_id(params[:id])
    unless @customer
      redirect_to root_path
    end
  end

  def update
    @customer = Customer.find_by_id(params[:id])
    @customer.update_attributes(params[:customer])
    flash[:notice] = 'Acme Customer has been updated.'
    redirect_to root_path
  end

  def show
  end

  def destroy
    redirect_to root_path
  end
end
