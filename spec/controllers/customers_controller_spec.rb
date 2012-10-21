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
    context 'with a valid customer' do
      it 'creates a customer' do
        expect{
          post :create, customer: attributes_for(:customer)
        }.to change(Customer, :count).by(1)
      end
      it 'redirects to the root path' do
        post :create, customer: attributes_for(:customer)
        response.should redirect_to root_path
      end
      it 'assigns an success message to flash' do
        post :create, customer: attributes_for(:customer)
        flash[:notice].should_not be_nil
      end
      it 'assigns an success message to flash with the customer name in it' do
        attributes = attributes_for(:customer)
        post :create, customer: attributes
        flash[:notice].should include attributes[:name]
      end
    end
    context 'with invalid customer' do
      before :each do
        post :create, customer: attributes_for(:invalid_customer)
      end
      it 'renders the new template' do
        response.should render_template :new
      end
      it 'assigns an error message to flash' do
        flash[:error].should_not be_nil
      end
    end
  end
  describe 'GET #edit' do
    context 'with an actual customer' do
      it 'assigns customer to @customer' do
        @customer = create(:customer)
        get :edit, id: @customer
        assigns(:customer).should eq @customer
      end
      it 'renders the edit template' do
        @customer = create(:customer)
        get :edit, id: @customer
        response.should render_template :edit
      end
    end
    context 'with an customer that is not real' do
      it 'redirects to root path' do
        get :edit, id: 123456
        response.should redirect_to root_path
      end
    end
  end
  describe 'PUT #update' do
    before :each do
      @customer = create(:customer)
    end
    context 'with a valid customer' do
      it 'redirects to the root path' do
        put :update, id: @customer
        response.should redirect_to root_path
      end
      it 'assigns an success message to flash' do
        put :update, id: @customer
        flash[:notice].should_not be_nil
      end
      it 'assigns an success message to flash with customer name in it' do
        put :update, id: @customer
        flash[:notice].should include @customer.name
      end
      it 'assigns customer to @customer' do
        put :update, id: @customer
        assigns(:customer).should eq(@customer)
      end
      it 'updates the customer' do
        put :update, id: @customer, customer: attributes_for(:customer, name: 'Derek')
        @customer.reload
        @customer.name.should eq 'Derek'
      end
    end
    context 'with invalid data' do
      before :each do
        @customer = create(:customer)
        post :update, id: @customer, customer: attributes_for(:invalid_customer)
      end
      it 'renders the new template' do
        response.should render_template :edit
      end
      it 'assigns an error message to flash' do
        flash[:error].should_not be_nil
      end
    end
  end
  describe 'DELETE #destroy' do
    it 'deletes the customer' do
      customer = create(:customer)
      expect{
        delete :destroy, id: customer
      }.to change(Customer, :count).by(-1)
    end
  end
end