class DropFamiliesJoiningFromTrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :families_joining
  end
end
