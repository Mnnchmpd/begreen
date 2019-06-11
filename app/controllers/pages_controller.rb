class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @result = Journey.new
  end

  def dashboard
    @user = current_user
    @journeys = current_user.journeys
    @total_distances = @journeys.where.not(distances: nil).map(&:distances).sum
    @car_indices = @journeys.where.not(distances: nil).where(travel_mode: "driving").map(&:distances).sum * 206
    @transit_indices = @journeys.where.not(distances: nil).where(travel_mode: "transit").map(&:distances).sum * 3.8
  end

  def new


  end

  def create
  end
end
