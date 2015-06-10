class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string :fs
      t.string :iata
      t.string :icao
      t.string :name
      t.string :phone_number
      t.boolean :active

      t.timestamps null: false
    end
    add_index :airlines, :icao
    add_index :airlines, :name
    add_index :airlines, :active
  end
end
