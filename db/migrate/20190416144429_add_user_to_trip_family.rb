class AddUserToTripFamily < ActiveRecord::Migration[5.2]
  def change
    add_reference :tripfamilies, :user, foreign_key: true
  end
end
