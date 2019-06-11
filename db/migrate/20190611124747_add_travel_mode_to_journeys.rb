class AddTravelModeToJourneys < ActiveRecord::Migration[5.2]
  def change
    add_column :journeys, :travel_mode, :string
  end
end
