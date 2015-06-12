class CreateFlightDetails < ActiveRecord::Migration
  def change
    create_table :flight_details do |t|

      t.string   :arrival_airport_fs_code
      t.string   :departure_airport_fs_code
      t.datetime :arrival_date_local
      t.datetime :arrival_date_utc
      t.string   :carrier_fs_code
      t.datetime :departure_date_local
      t.datetime :departure_date_utc
      t.integer  :scheduled_block_minutes
      t.string   :scheduled_equipment_iata_code
      t.integer  :flight_id
      t.string   :flight_number
      t.datetime :published_local_arrival
      t.datetime :published_utc_arrival
      t.datetime :published_departure_local
      t.datetime :published_departure_utc
      t.datetime :scheduled_gate_arrival_local
      t.datetime :scheduled_gate_arrival_utc
      t.datetime :scheduled_gate_departure_local
      t.datetime :scheduled_gate_departure_utc
      t.string   :flight_type
      t.string   :service_classes
      t.string   :status

      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :flight_details, :flight_id
  end
end



# -----------------------------------------

# t.integer :flight_duration
# t.float :flight_distance
# t.float :arrival_airport_latitude
# t.float :arrival_airport_longitude
# t.float :departure_airport_latitude
# t.float :departure_airport_longitude
