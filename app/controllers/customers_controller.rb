class CustomersController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
  end

  def create
    flash[:notice] = 'Acme Customer has been added'
    redirect_to root_path
  end

  def edit
  end

  def update
    flash[:notice] = 'Acme Customer has been updated'
    redirect_to root_path
  end

  def show
  end

  def destroy
    redirect_to root_path
  end
end
