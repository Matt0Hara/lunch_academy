class MeetupsController < ApplicationController
  def index
      @meetups = Meetup.all
  end

  def show
    @meetup = Meetup.find(params[:id])
  end
end
