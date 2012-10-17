require 'spec_helper'

describe CustomersController do
  describe 'GET #index' do
    it 'redirects to root path' do
      get :index
      response.should redirect_to root_path
    end
  end
  describe 'GET #new' do
    it 'assigns a new customer to @customer' do
      get :new
      assigns(:customer).should be_a_new(Customer)
    end
    it 'renders the new template' do
      get :new
      response.should render_template :new
    end
  end
  describe 'POST #create' do
    it 'redirects to the root path' do
      post :create
      response.should redirect_to root_path
    end
  end
  describe 'PUT #update' do
    it 'redirects to the root path' do
      put :update, id: 123
      response.should redirect_to root_path
    end
  end
end