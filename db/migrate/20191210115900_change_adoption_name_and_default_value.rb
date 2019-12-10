class ChangeAdoptionNameAndDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column_default :pets, "adoptable", from: "yes", to: "adoptable"
    rename_column :pets, "adoptable", "adoption_status"
  end
end
