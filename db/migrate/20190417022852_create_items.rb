class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name
      t.bigint :assigned_to

      t.timestamps
    end
  end
end
