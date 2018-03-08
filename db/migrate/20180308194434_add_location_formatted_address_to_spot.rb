class AddLocationFormattedAddressToSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :location_formatted_address, :string
  end
end
