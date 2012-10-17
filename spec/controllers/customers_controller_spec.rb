require 'spec_helper'

describe CustomersController do
  describe 'GET #index' do
    it 'redirects to root path' do
      get :index
      response.should redirect_to root_path
    end
  end
end