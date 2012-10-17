class Customer < ActiveRecord::Base
  attr_accessor :expiring_in_days
  attr_accessible :expiration_date, :name, :notes
  validates :name, presence: true
  before_validation :update_expiration_date, if: :expiring_in_days

  def update_expiration_date
    self.expiration_date = Date.new + self.expiring_in_days.to_i.days
  end

end
