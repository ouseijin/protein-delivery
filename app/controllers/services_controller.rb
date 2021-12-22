class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
    @review = Review.new
    @reviews = @service.reviews.includes(:user).order(created_at: :desc)
  end
end
