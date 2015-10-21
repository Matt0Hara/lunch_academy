class Meetup < ActiveRecord::Base
  # paginates_per 10
  has_many :attendees
  has_many :comments
  belongs_to :user
  belongs_to :location

  validates :title, presence: true
  validates :user_id, presence: true
  validates :datetime, presence: true
  validates :description, length: { minimum: 20 }, presence: true
end
