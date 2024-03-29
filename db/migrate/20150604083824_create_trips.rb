class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.datetime :departure_date
      t.text :status
      t.string :flight_number
      t.string :slug

      # Associations
      t.integer :user_id
      t.integer :airline_id

      t.timestamps null: false
    end
    add_index :trips, :user_id
    add_index :trips, :airline_id
    add_index :trips, :slug, unique: true
    add_index :trips, :departure_date
  end
end
