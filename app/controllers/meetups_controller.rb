class MeetupsController < ApplicationController
  def index
      @meetups = Meetup.order(created_at: :desc).page(params[:page])
  end

  def show
    @meetup = Meetup.find(params[:id])
  end
end
