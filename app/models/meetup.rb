class Meetup < ActiveRecord::Base
  paginates_per 20
  has_many :attendees
  belongs_to :user
  validates :user_id, presence: true
end
