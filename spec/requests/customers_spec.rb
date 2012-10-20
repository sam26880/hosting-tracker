require 'spec_helper'
describe 'Managing customers' do
  describe 'adding a customer' do
    it 'adds a customer' do
      visit root_path
      click_link 'Add Customer'
      expect{
        fill_in 'Customer name', with: 'John Doe'
        click_button 'Save'
      }.to change(Customer, :count).by(1)
      current_path.should eq root_path
    end
    it 'does not add a customer when missing fields'
  end
  describe 'deleting a customer' do
  end
  describe 'editing a customer' do
  end
end