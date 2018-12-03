class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :location
      t.string :name
      t.text :description
      t.integer :capacity
      t.float :dayrate

      t.timestamps
    end
  end
end
