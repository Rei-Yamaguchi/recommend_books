class RegistrationsController < Devise::RegistrationsController

    protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end
      # ユーザー情報を更新したら確認ページへ遷移させる
    def after_update_path_for(resource)
      # 自分で設定した「マイページ」へのパス
      users_show_path(current_user)
    end

  end