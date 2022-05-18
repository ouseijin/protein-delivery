class MenusController < ApplicationController
  def all_menus
    @q = Menu.ransack(params[:q])
    @menus = @q.result(distinct: true).includes(:service, :nutrients, :menu_likes).page(params[:page])
  end

  def index
    @service = Service.find(params[:service_id])
    @menus = Menu.where(service_id: params[:service_id]).includes(:service, :nutrients, :menu_likes).page(params[:page])
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def menu_rank
    @menu_like_ranks = Menu.includes(:service, :nutrients, :menu_likes)
                           .find(MenuLike.group(:menu_id).order('count(menu_id) desc').limit(5).pluck(:menu_id))
  end

  def like_menus
    likes = MenuLike.where(user_id: current_user.id).pluck(:menu_id)
    @menus = Menu.where(id: likes).includes(:service, :nutrients, :menu_likes).page(params[:page])
    # findメソッドではメソッドチェインが使えないためwhere
  end
end
