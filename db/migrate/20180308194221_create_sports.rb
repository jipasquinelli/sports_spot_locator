class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.integer :spot_id
      t.string :name

      t.timestamps

    end
  end
end
