class AddCityToOffices < ActiveRecord::Migration[5.2]
  def change
    add_column :offices, :city, :string
    add_column :offices, :street, :string
  end
end
