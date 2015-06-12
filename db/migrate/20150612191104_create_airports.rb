class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string  :city
      t.string  :city_code
      t.integer :classification
      t.string  :country_code
      t.string  :country_name
      t.string  :delay_index_url
      t.integer :elevation_feet
      t.string  :faa
      t.string  :fs
      t.string  :href
      t.string  :iata
      t.string  :icao
      t.float   :latitude
      t.float   :longitude
      t.string  :name
      t.string  :postal_code
      t.string  :region_name
      t.string  :state_code
      t.string  :street
      t.string  :time_zone_region_name
      t.float   :utc_offset_hours
      t.string  :weather_url
      t.string  :weather_zone
      t.string  :slug

      t.references :flight_detail, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :airports, :city
    add_idnex :airports, :iata
    add_index :airports, :slug, unique: true
  end
end
