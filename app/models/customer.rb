class Customer < ActiveRecord::Base
  default_scope order: :expiration_date
  attr_accessible :expiration_date, :name, :notes
  validates :name, presence: true
end