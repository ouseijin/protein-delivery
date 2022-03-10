class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  private

  def not_authenticated
    redirect_to login_path, info: 'こちらは、ログインページです。　SNS認証もございますので、ぜひお使い下さい。'
  end
end
