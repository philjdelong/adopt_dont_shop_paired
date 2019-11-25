class AddDescriptionToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :description, :string, default: "This could be your next best friend!"
  end
end
