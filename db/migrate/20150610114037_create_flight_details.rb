class CreateFlightDetails < ActiveRecord::Migration
  def change
    create_table :flight_details do |t|
      t.string :arrival_airport_fs_code
      t.float :arrival_airport_latitude
      t.float :arrival_airport_longitude
      t.datetime :arrival_date_local
      t.datetime :arrival_date_utc
      t.string :departure_airport_fs_code
      t.float :departure_airport_latitude
      t.float :departure_airport_longitude
      t.datetime :departure_date_local
      t.datetime :departure_date_utc
      t.integer :flight_duration
      t.float :flight_distance
      t.integer :flight_id
      t.string :flight_number
      t.datetime :scheduled_gate_arrival_local
      t.datetime :scheduled_gate_arrival_utc
      t.datetime :scheduled_gate_departure_local
      t.datetime :scheduled_gate_departure_utc
      t.string :status
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :flight_details, :flight_id
  end
end
