require 'spec_helper'

describe DashboardController do
  describe 'GET #index' do
    before :each do
      @f_customer = create(:customer, name: 'F Customer')
      @a_customer = create(:customer, name: 'A Customer')
      @z_customer = create(:customer, name: 'Z Customer')
    end
    it 'creates an array of customers that is sorted by name' do
      get :index
      assigns(:customers).should eq([@a_customer, @f_customer, @z_customer])
    end
  end
end