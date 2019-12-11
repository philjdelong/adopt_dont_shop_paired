class RenamePetAdoptableDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column :pets, "Adoptable", :string
    change_column_default :pets, "Adoptable", from: false, to: "yes"
  end
end
