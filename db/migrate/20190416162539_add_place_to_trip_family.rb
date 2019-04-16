class AddPlaceToTripFamily < ActiveRecord::Migration[5.2]
  def change
    add_column :tripfamilies, :place, :string
  end
end
