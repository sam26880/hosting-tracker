require 'spec_helper'
describe Customer do
  it 'has a valid factory' do
    build(:customer).should be_valid
  end
  it 'requires a name' do
    build(:customer, name: nil).should_not be_valid
  end
  describe 'expiration date' do
    it 'is a date object' do
      create(:customer).expiration_date.should be_kind_of(Date)
    end
  end
end
