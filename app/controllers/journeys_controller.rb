class JourneysController < ApplicationController
  def show
    @journey = Journey.find(params[:id])

    # @markers = @journeys.map do |journey|
    #   {
    #     lat: journey.latitude,
    #     lng: journey.longitude,
    #     infoWindow: render_to_string(partial: "infowindow", locals: { journey: journey })

    #     # Uncomment the above line if you want each of your markers to display a info window when clicked
    #     # (you will also need to create the partial "/journeys/map_box")
    #   }
    # end
  end

  def index
    @journeys = Journey.all

    # url = 'https://api.github.com/users/ssaunier'
    # user_serialized = open(url).read
    # user = JSON.parse(user_serialized)

    # puts "#{user['starting_point']} - #{user['ending_point']}"
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.user = current_user
    if @journey.save
      redirect_to journeys_path
    else
      render :home
    end
  end

  def journey_params
    params.require(:journey).permit(:starting_point, :ending_point)
  end
end
