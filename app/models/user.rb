class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum sex: { 男: 0, 女: 1,その他: 2, 解答しない: 3}
  enum favorite_genre: { 現代小説: 0, 歴史小説: 1,ノンフィクション: 2, ファンタジー: 3}
  validates :nickname, presence: true #追記

    # 物理削除の代わりにユーザーの`deleted_at`をタイムスタンプで更新
    def soft_delete  
      update_attribute(:deleted_at, Time.current)  
    end
  
    # ユーザーのアカウントが有効であることを確認 
    def active_for_authentication?  
      super && !deleted_at  
    end  
  
    # 削除したユーザーにカスタムメッセージを追加します  
    def inactive_message   
      !deleted_at ? super : :deleted_account  
    end 
    has_many :posts, dependent: :destroy
    has_many :responses, dependent: :destroy

    def my_response?(response)
      response.user_id == id　#self.idの省略形
    end
    
    #こちらのほうが汎用的なので採用◎
    def own?(object)
        id == object.user_id
      end

    mount_uploader :image, ImageUploader
    
end
