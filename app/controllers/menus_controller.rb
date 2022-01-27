class MenusController < ApplicationController
  def all_menus
    @q = Menu.ransack(params[:q])
    @menus = @q.result(distinct: true).includes(:service, :nutrients, :menu_likes)
  end

  def index
    @menus = Menu.where(service_id: params[:service_id]).includes(:service, :nutrients, :menu_likes)
  end

  def menu_rank
    @menu_like_ranks = Menu.includes(:service, :nutrients, :menu_likes)
                           .find(MenuLike.group(:menu_id).order('count(menu_id) desc').limit(5).pluck(:menu_id))
  end
end
