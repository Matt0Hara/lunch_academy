class Meetup < ActiveRecord::Base
  paginates_per 10
  has_many :attendees
  belongs_to :user
  validates :title, presence: true
  validates :user_id, presence: true
  validates :datetime, presence: true
  validates :description, length: { minimum: 20 }, presence: true
end
