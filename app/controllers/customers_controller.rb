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
      redirect_to root_path, notice: "#{@customer.name} has been created."
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
    if @customer.update_attributes(params[:customer])
      flash[:notice] = "#{@customer.name} has been updated."
      redirect_to root_path
    else
      flash[:error] = "Customer could not be updated"
      render :edit
    end
  end

  def show
    @customer = Customer.find_by_id(params[:id])
  end

  def destroy
    @customer = Customer.find_by_id(params[:id])
    flash[:notice] = 'Customer has been deleted.' if @customer.destroy
    redirect_to root_path
  end
end
