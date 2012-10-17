class Customer < ActiveRecord::Base
  attr_accessible :expiration_date, :name, :notes
end
