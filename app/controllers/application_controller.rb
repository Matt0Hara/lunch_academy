class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  module MeetupHelper
    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
  end

  def cube_authentication
    unless current_user
      flash[:errors] = "You need to sign in to do that!"
      redirect_to(meetups_path)
    end
  end
end
