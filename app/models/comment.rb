class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :meetup

  validates :user_id, presence: true
  validates :meetup_id, presence: true
  validates :body, presence: true
end
