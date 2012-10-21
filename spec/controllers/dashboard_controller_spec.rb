require 'spec_helper'
describe DashboardController do
  describe 'GET #index' do
    before :each do
      @kind_soon_customer = create(:customer, expiration_date: Date.today + 100.days)
      @long_customer = create(:customer, expiration_date: Date.today + 365.days)
      @soon_customer = create(:customer, expiration_date: Date.today + 30.days)
    end
    it 'creates an array of customers that is sorted by expiration date' do
      get :index
      assigns(:customers).should eq([@soon_customer, @kind_soon_customer, @long_customer])
    end
    it 'renders the index template' do
      get :index
      response.should render_template :index
    end
  end
end