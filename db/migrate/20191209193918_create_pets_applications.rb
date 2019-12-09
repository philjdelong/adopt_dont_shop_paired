class CreatePetsApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :pets_applications do |t|
      t.references :pets, foreign_key: true
      t.references :applications, foreign_key: true 

      t.timestamps
    end
  end
end
