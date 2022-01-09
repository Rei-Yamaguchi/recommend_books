class UsersController < ApplicationController
  def show
    @user = current_user
  end
  def edit
    @user = User.find_by(id: params[:id])
  end
  private
  def post_params
    params.require(:post).permit(:content, :image)
  end
end
