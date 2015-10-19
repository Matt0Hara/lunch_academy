class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :meetup

  validates :user_id, presence: true
  validates :meetup_id, presence: true
  validates :body, presence: true

  def already_exists?
    Comment.all.each do |comment|
      if comment = self
        return true
      end
    end
    return false
  end
end
