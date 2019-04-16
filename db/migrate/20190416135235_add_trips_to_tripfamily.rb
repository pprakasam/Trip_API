class AddTripsToTripfamily < ActiveRecord::Migration[5.2]
  def change
    add_reference :tripfamilies, :trip, foreign_key: true
  end
end
