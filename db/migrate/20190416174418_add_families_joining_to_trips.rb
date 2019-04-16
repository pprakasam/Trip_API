class AddFamiliesJoiningToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :families_joining, :string, array: true, default: []
  end
end
