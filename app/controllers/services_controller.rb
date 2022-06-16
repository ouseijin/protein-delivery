class ServicesController < ApplicationController
  before_action :require_login, only: [:service_rank]

  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
    @reviews = @service.reviews.includes(:user, :review_likes).order(created_at: :desc)
  end

  def service_rank
    @service_rate_ranks = Service.rate_rank
  end
end
