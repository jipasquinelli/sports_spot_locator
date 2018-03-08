class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :location
      t.string :name

      t.timestamps

    end
  end
end
