class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.datetime :departure_date
      t.string :flight_number
      t.integer :flight_id
      t.text :status

      # Associations
      t.integer :user_id
      t.integer :airline_id

      t.timestamps null: false
    end
    add_index :trips, :user_id
    add_index :trips, :airline_id
    add_index :trips, :departure_date
    add_index :trips, :flight_number
    add_index :trips, :flight_id
  end
end
