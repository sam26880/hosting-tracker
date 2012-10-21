require 'spec_helper'
describe 'Managing customers' do
  describe 'adding a customer' do
    it 'adds a customer' do
      visit root_path
      click_link 'Add customer'
      expect{
        fill_in 'Customer name', with: 'Acme Co'
        fill_in 'Expiration date', with: Date.today
        fill_in 'Notes', with: 'Diagrams for silly devices to capture a road runner.'
        click_button 'Save'
      }.to change(Customer, :count).by(1)
      @customer = Customer.find(:first)
      @customer.name.should eq 'Acme Co'
      @customer.expiration_date.should eq Date.today
      @customer.notes.should eq 'Diagrams for silly devices to capture a road runner.'
      current_path.should eq root_path
    end
    it 'does not add a customer when missing fields' do
      visit root_path
      click_link 'Add customer'
      expect{
        fill_in 'Customer name', with: nil
        click_button 'Save'
      }.to_not change(Customer, :count).by(1)
    end
  end
  describe 'deleting a customer' do
    it 'deletes the customer' do
      @customer = create(:customer)
      visit root_path
      within 'section.customer' do
        expect {
          click_link 'Delete'
        }.to change(Customer, :count).by(-1)
      end
    end
  end
  describe 'editing a customer' do
    before :each do
      @customer = create(:customer)
    end
    context 'with valid data' do
      it 'updates the customer' do
        visit root_path
        within 'section.customer' do
          click_link 'Edit'
        end
        fill_in 'Customer name', with: 'Acme Co'
        fill_in 'Expiration date', with: Date.today
        fill_in 'Notes', with: 'Diagrams for silly devices to capture a road runner.'
        click_button 'Save'
        @customer.reload
        @customer.name.should eq 'Acme Co'
        @customer.expiration_date.should eq Date.today
        @customer.notes.should eq 'Diagrams for silly devices to capture a road runner.'
      end
    end
    context 'with invalid data' do
      it 'does not update the customer' do
        visit root_path
        within 'section.customer' do
          click_link 'Edit'
        end
        fill_in 'Customer name', with: nil
        fill_in 'Expiration date', with: Date.today + 30.days
        click_button 'Save'
        @customer.reload
        @customer.expiration_date.should_not eq Date.today + 30.days
      end
    end
  end
end