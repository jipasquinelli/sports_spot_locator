class AddLocationLatitudeToSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :location_latitude, :float
  end
end
