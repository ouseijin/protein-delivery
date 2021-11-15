class MenusController < ApplicationController
  def all_menus
    @menus = Menu.all
  end
  
  def index
    @service = Service.find(params[:service_id])
    @menus = Menu.where(service_id: @service)
  end
end
