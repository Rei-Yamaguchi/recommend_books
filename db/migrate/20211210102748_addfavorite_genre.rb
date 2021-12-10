class AddfavoriteGenre < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favorite_genre, :integer
  end
end
