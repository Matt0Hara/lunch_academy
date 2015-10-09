class MeetupsController < ApplicationController
  helper MeetupHelper
  def index
    @meetups = Meetup.order(created_at: :desc).page(params[:page])
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.user = current_user
    @meetup.save!
    redirect_to meetups_path
  end

  private

  def meetup_params
    #change new to :meetup
    params.require(:new).permit(:title, :description, :user_id,
                                      :datetime)
  end
end
