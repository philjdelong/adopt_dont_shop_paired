class ChangeDefaultValueForPetsImage < ActiveRecord::Migration[5.1]
  def change
    change_column_default :pets, :image, "https://cdn0.wideopenpets.com/wp-content/uploads/2018/01/Im-a-doggo-770x405.jpg"
  end
end
