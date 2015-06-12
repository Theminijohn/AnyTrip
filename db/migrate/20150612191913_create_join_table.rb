class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :airports, :flight_details do |t|
      t.index [:airport_id, :flight_detail_id], name: 'airport_on_flight_id'
      t.index [:flight_detail_id, :airport_id], name: 'flight_on_airport_id'
    end
  end
end
