require 'spec_helper'

describe Customer do
  it 'has a valid factory' do
    build(:customer).should be_valid
  end
end
