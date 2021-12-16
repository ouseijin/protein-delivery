class OauthsController < ApplicationController
  # skip_before_action :require_login
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]

    if params[:denied].present?
      redirect_to root_path, warning: 'ログインをキャンセルしました'
    elsif (@user = login_from(provider))
      redirect_to root_path, success: "#{provider.titleize}でログインしました"
    else
      create_user_from(provider)
    end
  end

  private

  def create_user_from(provider)
    @user = create_from(provider)
    reset_session
    auto_login(@user)
    redirect_to root_path, success: "#{provider.titleize}でログインしました"
  rescue ActiveRecord::RecordNotUnique
    redirect_to root_path, danger: "同じメールアドレスのユーザーが他に存在しているためログイン出来ません"
  rescue StandardError
    redirect_to root_path, danger: "#{provider.titleize}でのログインに失敗しました"
  end
end
