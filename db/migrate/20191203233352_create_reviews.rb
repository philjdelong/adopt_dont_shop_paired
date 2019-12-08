class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string      :title,     default:  "No Title"
      t.integer     :rating
      t.string      :content,   default:  "No Content"
      t.string      :picture,   default:  "No Picture"

      t.timestamps
    end
  end
end
