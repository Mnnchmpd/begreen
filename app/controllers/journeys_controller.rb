class JourneysController < ApplicationController

def results
  @starting_point = params["journey"]["starting_point"]
  @ending_point = params["journey"]["ending_point"]
  travel_mode = ["driving", "walking", "bicycling", "transit"]

  @results = travel_mode.map do |mode|
    result_api = RestClient.get("https://maps.googleapis.com/maps/api/directions/json?
&mode=#{mode}&origin=#{@starting_point}&destination=#{@ending_point}&key=#{ENV['GOOGLE_API_SERVER_KEY']}")

    result = JSON.parse(result_api)
    result["travel_mode"] = mode
    result

  end

end

  def details
    @journeys = Journey.where.not(latitude: nil, longitude: nil)

    @markers = @journeys.map do |journey|
      {
        lat: journey.latitude,
        lng: journey.longitude,
      }
    end
    # @steps = params["details"]["travel_mode"]
  end

  # def create
  #   @journey = Journey.new(journey_params)
  #   @journey.user = current_user
  #   if @journey.save
  #     redirect_to journeys_path
  #   else
  #     render :home
  #   end
  # end

  # def journey_params
  #   params.require(:journey).permit(:starting_point, :ending_point)
  # end


end
