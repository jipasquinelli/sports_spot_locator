class AddLocationLongitudeToSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :location_longitude, :float
  end
end
