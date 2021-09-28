class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :user_uid
      t.integer :movie_id
      t.integer :potatoes
      t.text :comment

      t.timestamps
    end
  end
end
