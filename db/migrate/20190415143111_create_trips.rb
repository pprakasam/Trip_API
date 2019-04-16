class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :place, null: false, presence: true
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.date :from_date
      t.date :to_date
      t.string :families_joining

      t.timestamps
    end
  end
end
