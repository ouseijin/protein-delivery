class LikesController < ApplicationController
  before_action :require_login

  def create
    menu = Menu.find(params[:menu_id])
    current_user.like(menu)
    redirect_back fallback_location: root_path, success: 'いいねしました'
  end

  def destroy
    menu = current_user.likes.find(params[:id]).menu
    current_user.unlike(menu)
    redirect_back fallback_location: root_path, success: 'いいねを取り消しました'
  end
end
