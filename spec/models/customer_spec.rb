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
    it 'will update the date when given days instead of date' do
      thirty_days_from_now = Date.new + 30.days
      create(:customer, expiration_date: nil, expiring_in_days: 30).expiration_date.should eq(thirty_days_from_now)
    end
  end
end
