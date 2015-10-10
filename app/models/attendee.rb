class Attendee < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :user

  validates :user, uniqueness: { scope: :meetup }
  validates :user, presence: true
  validates :meetup_id, presence: true
end
