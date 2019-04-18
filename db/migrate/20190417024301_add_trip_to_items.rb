class AddTripToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :trip, foreign_key: true
  end
end
