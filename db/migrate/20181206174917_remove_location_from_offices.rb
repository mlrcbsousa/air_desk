class RemoveLocationFromOffices < ActiveRecord::Migration[5.2]
  def change
    remove_column :offices, :location
  end
end
