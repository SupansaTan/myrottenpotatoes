class CreateReviews < ActiveRecord::Migration[4.2]
  def up
    create_table 'reviews' do |t|
      t.integer    'potatoes'
      t.text       'comments'
      t.references 'user'
      t.references 'movie'
    end
  end
  def down ; drop_table 'reviews' ; end
end
