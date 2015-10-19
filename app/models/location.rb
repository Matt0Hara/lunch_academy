class Location < ActiveRecord::Base
  has_many :meetups
  validates :address, presence: true

  def is_existing?
    if Location.find_by(address: self.address)
      true
    else
      false
    end
  end
end
