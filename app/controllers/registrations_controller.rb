class RegistrationsController < Devise::RegistrationsController

      # DELETE /resource
      def destroy
        resource.soft_delete
        Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
        set_flash_message :notice, :destroyed
        yield resource if block_given?
        respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
      end
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