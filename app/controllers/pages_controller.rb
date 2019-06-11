class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @result = Journey.new
  end

  def dashboard
    @user = current_user
    @journeys = Journey.where(user: current_user)
  end
end
