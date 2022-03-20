module ApplicationHelper
  def create_alert_data
    if logged_in?
      nil
    else
      {
        confirm: "【確認】こちらはログインした方のみが使える機能となります。\nログインページへ移動しますか？",
        cancel: 'キャンセル',
        commit: 'ログインページへ移動する',
        title: 'ログインページへの案内'
      }
    end
  end

  def delete_confirm
    {
      confirm: "【確認】こちらの口コミを削除してもよろしいですか？",
      cancel: 'キャンセル',
      commit: '削除する',
      title: '口コミの削除確認'
    }
  end
end
