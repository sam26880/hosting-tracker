require 'spec_helper'
describe 'Dashboard' do
  it 'lists out customers' do
    customer = create(:customer)
    visit root_path
    within "#customer_#{customer.id}" do
      page.should have_content customer.name
    end
  end
end