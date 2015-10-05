class Meetup < ActiveRecord::Base
  paginates_per 5
  belongs_to :user
  validates :user_id, presence: true
end
