class JourneysController < ApplicationController

  # def show
  #   @journey = Journey.find(params[:id])

  #   # @markers = @journeys.map do |journey|
  #   #   {
  #   #     lat: journey.latitude,
  #   #     lng: journey.longitude,
  #   #     infoWindow: render_to_string(partial: "infowindow", locals: { journey: journey })

  #   #     # Uncomment the above line if you want each of your markers to display a info window when clicked
  #   #     # (you will also need to create the partial "/journeys/map_box")
  #   #   }
  #   # end
  # end
# "DRIVING", "BICYCLING", "WALKING"
  def results
    @starting_point = params["journey"]["starting_point"]
    @ending_point = params["journey"]["ending_point"]
    travel_mode = ["DRIVING" || "WALKING" || "BICYCLING"]
    result_api = RestClient.get("https://maps.googleapis.com/maps/api/directions/json?
&mode=#{travel_mode}&origin=#{@starting_point}&destination=#{@ending_point}&key=AIzaSyC4r0g0exhWArQFf1lrzZGhQ9_uVmGE0Lo")

    @results = travel_mode.map do |mode|
      JSON.parse(result_api)["routes"][0]["legs"][0]["distance"]["text"] &&
      JSON.parse(result_api)["routes"][0]["legs"][0]["duration"]["text"]

  end
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

  def detail
  end
end
