class Api::V1::MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all
    respond_to do |format|
      format.json { render json: @meetups }
    end
  end
end
