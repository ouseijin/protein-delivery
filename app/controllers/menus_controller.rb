class MenusController < ApplicationController
  def all_menus
    @q = Menu.ransack(params[:q])
    @menus = @q.result(distinct: true).includes(:service, :menu_likes)
  end

  def index
    # @service = Service.find(params[:service_id])
    @menus = Menu.where(service_id: params[:service_id]).includes(:service, :nutrients, :menu_likes)
    # @nutrients = Nutrient.where(menu_id: @menus)
  end

  def menu_rank
    @menu_like_ranks = Menu.find(MenuLike.group(:menu_id).order('count(menu_id) desc').limit(5).pluck(:menu_id))
  end
end
