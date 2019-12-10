class RenamePetAdoptableDfaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column :pets, "adoptable", :string
    change_column_default :pets, "adoptable", from: false, to: "yes"
  end
end
