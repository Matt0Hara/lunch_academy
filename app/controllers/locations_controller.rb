class LocationsController < ApplicationController

  def create
    if request.xhr?
      binding.pry
      address = params[:location][:address]
      @location = Location.new(address: address)
      unless @location.is_existing?
        # coordinates = Geocoder.coordinates(@location.address)
        # @location.latitude = coordinates[0]
        # @location.longitude = coordinates[1]
        if @location.save!
          respond_to do |format|
            format.html { render nothing: true }
            format.json { render json: @location.address }
          end
          @meetup = Meetup.find(params[:meetup_id])
          @meetup.location = @location
          @meetup.save
        else
          flash[:errors] = "Invalid entry."
        end
      end
      respond_to do |format|
        format.html
        format.json { render json: @location.to_json }
      end
    else
      address = params[:location][:address]
      @location = Location.new(address: address)
      unless @location.is_existing?
        # @location.latitude = coordinates[0]
        # @location.longitude = coordinates[1]
        if @location.save!
          redirect_to meetups_path
        end
      end
    end
  end
end
