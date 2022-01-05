class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  private

  def not_authenticated
    redirect_to login_path, info: 'こちらは、ログインしている場合に使える機能です。ぜひ、ログインして使って下さい。'
  end
end
