class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :airports, :trips do |t|
      t.index [:airport_id, :trip_id]
      t.index [:trip_id, :airport_id]
    end
  end
end
