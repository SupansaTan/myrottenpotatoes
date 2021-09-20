class AddDirectorToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :director, :string
  end
end
