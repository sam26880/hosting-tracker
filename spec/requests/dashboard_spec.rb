require 'spec_helper'
describe 'Dashboard' do
  it 'lists out customers' do
    customer = create(:customer)
    visit root_path
    within "#customer_#{customer.id}" do
      page.should have_content customer.name
      page.should have_link(customer.name, href: customer_path(customer))
    end
  end
end