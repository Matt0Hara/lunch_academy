class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    binding.pry
  end
end
