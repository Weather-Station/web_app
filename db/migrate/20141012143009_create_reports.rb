class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :deviceID
      t.string :token
      t.integer :temperature
      t.integer :pressure
      t.integer :humidity
      t.integer :wind_speed
      t.integer :wind_direction
      t.integer :rainfall
      t.integer :light_level
      t.integer :battery_level
      t.datetime :record_time

      t.timestamps
    end
  end
end
