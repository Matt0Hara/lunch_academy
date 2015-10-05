class Meetup < ActiveRecord::Base
  validates :location_name, presence: true
  validates :location_address, presence: true
  validates :user_id, presence: true
end
