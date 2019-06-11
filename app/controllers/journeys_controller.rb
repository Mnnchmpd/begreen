class JourneysController < ApplicationController
  def results
    @starting_point = params["journey"]["starting_point"]
    @ending_point = params["journey"]["ending_point"]
    travel_mode = ["driving", "walking", "bicycling", "transit"]

    @results = travel_mode.map do |mode|
      result_api = RestClient.get("https://maps.googleapis.com/maps/api/directions/json?&mode=#{mode}&origin=#{@starting_point.gsub(/[^[:ascii:]]/, '')}&destination=#{@ending_point.gsub(/[^[:ascii:]]/, '')}&key=#{ENV['GOOGLE_API_SERVER_KEY']}")

      result = JSON.parse(result_api)
      result["travel_mode"] = mode
      result
    end
  end

  def details
    @journey = Journey.new
    @starting_point = params["starting_point"]
    @ending_point = params["ending_point"]
    @steps = JSON.parse(params["steps"])
    @markers = [
      @steps.first["start_location"],
      @steps.last["end_location"]
    ]

    @map_steps = @steps.map do |s|
      [s["start_location"].values.reverse, s["end_location"].values.reverse]
    end.flatten(1)
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.user = current_user
    if @journey.save
      redirect_to dashboard_path
    else
      render :details
    end
  end

  def journey_params
    params.require(:journey).permit(:starting_point, :ending_point)
  end
end
