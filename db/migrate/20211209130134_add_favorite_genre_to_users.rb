class AddFavoriteGenreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favorite_genre, :string
  end
end
