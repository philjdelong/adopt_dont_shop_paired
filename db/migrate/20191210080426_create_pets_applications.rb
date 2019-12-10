class CreatePetsApplications < ActiveRecord::Migration[5.1]
  def change
    drop_table :pets_applications
    create_table :pets_applications do |t|
      t.references :pet, foreign_key: true
      t.references :application, foreign_key: true
    end
  end
end
