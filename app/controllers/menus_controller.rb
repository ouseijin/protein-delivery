class MenusController < ApplicationController
  def all_menus
    @q = Menu.ransack(params[:q])
    @menus = @q.result(distinct: true).includes(:service, :likes)
  end

  def index
    @service = Service.find(params[:service_id])
    @menus = Menu.where(service_id: @service).includes(:service, :likes)
  end
end
