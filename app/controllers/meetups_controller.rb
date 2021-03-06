class MeetupsController < ApplicationController
  helper MeetupHelper
  before_action :cube_authentication, only: [:create, :new]
  def index
    if params[:search]
      @meetups = Meetup.where("title = ?",
                              params[:search]).page(params[:page]).per(10)
    else
      @meetups = Meetup.order(created_at: :desc).page(params[:page]).per(10)
    end
    @addresses = []
    @meetups.each do |meetup|
      unless meetup.location.nil?
        @addresses << meetup.location.address
      end
    end
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

  def destroy
    @meetup = Meetup.find(params[:id])
    @meetup.attendees.each(&:destroy)
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
    @location = Location.new(address: params[:new][:address])
    if @location.save
      @meetup.location = @location
    end
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
