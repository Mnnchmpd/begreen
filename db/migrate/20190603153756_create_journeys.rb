class CreateJourneys < ActiveRecord::Migration[5.2]
  def change
    create_table :journeys do |t|
      t.string :starting_point
      t.string :ending_point
      t.string :footprint
      t.string :duration
      t.datetime :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
