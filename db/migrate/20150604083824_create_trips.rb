class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :airline
      t.datetime :departure_date
      t.string :flight_number
      t.text :status
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :trips, :user_id
    add_index :trips, :departure_date
    add_index :trips, :flight_number
  end
end
