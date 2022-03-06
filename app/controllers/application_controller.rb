class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  private

  def not_authenticated
    redirect_to login_path, info: 'こちらは、ログイン画面です。　SNS認証もございますので、ぜひお使い下さい。'
  end

  def create_alert_data
    if logged_in?
      data = nil
    else
      data = { confirm: "【確認】こちらはログインした方のみが使える機能となります。\nOKを押して頂ければログイン画面に移動します。"}
    end
  end
  helper_method :create_alert_data
end
