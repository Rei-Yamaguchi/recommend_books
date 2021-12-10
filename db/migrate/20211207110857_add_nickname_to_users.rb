class AddNicknameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string 
    add_column :users, :type, :string 
    add_column :users, :favorite_genre, :string 
    add_column :users, :self_introduction, :string 
    add_column :users, :sex, :string 
    add_column :users, :birthday, :string 
    add_column :users, :link, :string 
    add_column :users, :image, :string 
  end
end
