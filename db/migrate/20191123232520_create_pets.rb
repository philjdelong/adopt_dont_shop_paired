class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string      :image,   default:  "No Image"
      t.string      :name,    default:  "Name Unknown"
      t.integer     :age,     default:  "Age Unknown"
      t.string      :sex,     default:  "Sex Unknown"
      t.references  :shelter, foreign_key: true

      t.timestamps
    end
  end
end
