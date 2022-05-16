class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_user, only: [:edit, :update]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: 'ユーザーの編集が完了しました'
    else
      flash.now[:warning] = 'ユーザーの編集に失敗しました'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id) # @user = current_user　だと、プロフィール編集失敗時にcurrent_userがupdateの影響を受けてしまう。User.findであれば、DBから取得したUserのため、current_userに影響を及ぼさない
  end

  def user_params
    params.require(:user).permit(:email, :name, :avatar, :avatar_cache)
  end
end
