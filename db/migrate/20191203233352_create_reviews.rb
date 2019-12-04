class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string      :title
      t.integer     :rating
      t.string      :content
      t.string      :picture,  default:"No picture present"

      t.timestamps
    end
  end
end
