class ChangeAssignedToBeStringInItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :assigned_to, :string
  end
end
