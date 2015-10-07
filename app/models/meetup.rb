class Meetup < ActiveRecord::Base
  paginates_per 20
  belongs_to :user
  validates :user_id, presence: true
end
