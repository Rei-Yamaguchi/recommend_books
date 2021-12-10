class RemovegenreFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :favorite_genre, :string
  end
end
