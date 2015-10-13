class MeetupsController < ApplicationController
  helper MeetupHelper
  before_action :cube_authentication, only: [:create, :new]
  def index
    @meetups = Meetup.order(created_at: :desc).page(params[:page])
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

  def destroy
    @meetup = Meetup.find(params[:id])
    @meetup.attendees.each do |attendee|
      attendee.destroy
    end
    @meetup.destroy
    redirect_to meetups_path
  end

  def new
    cube_authentication
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.user = current_user
    if @meetup.save
      redirect_to meetups_path
    else
      flash[:errors] = @meetup.errors.full_messages.join(". ")
      redirect_to meetups_path
    end
  end

  private

  def meetup_params
    # change new to :meetup
    params.require(:new).permit(:title, :description, :user_id,
                                :datetime)
  end
end
