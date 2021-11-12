class MenusController < ApplicationController
  def index
    @service = Service.find(params[:service_id])
    @menus = Menu.where(service_id: @service)
  end
end
