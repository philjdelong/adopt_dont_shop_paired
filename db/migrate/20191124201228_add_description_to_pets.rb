class AddDescriptionToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :description, :string, default: "No Description"
  end
end
