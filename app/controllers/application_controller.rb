class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  private

  def not_authenticated
    redirect_to login_path, info: 'こちらは、ログインページです。　SNS認証もございますので、ぜひお使い下さい。'
  end

  def create_alert_data
    if logged_in?
      data = nil
    else
      data = { confirm: "【確認】こちらはログインした方のみが使える機能となります。\nログインページへ移動しますか？",
        cancel: 'キャンセル',
        commit: 'ログインページへ移動する'
      }
    end
  end
  helper_method :create_alert_data
end
