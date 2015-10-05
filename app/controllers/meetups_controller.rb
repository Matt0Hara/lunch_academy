class MeetupsController < ApplicationController
  def index
      @meetups = Meetup.page params[:page]
  end

  def show
    @meetup = Meetup.find(params[:id])
  end
end
