class CreateTripfamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :tripfamilies do |t|
      t.string :family

      t.timestamps
    end
  end
end
