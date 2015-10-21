class Location < ActiveRecord::Base
  has_many :meetups
  validates :address, presence: true

  def existing?
    if Location.find_by(address: address)
      true
    else
      false
    end
  end
end
