class AddDistanceToJourneys < ActiveRecord::Migration[5.2]
  def change
    add_column :journeys, :distances, :float
  end
end
