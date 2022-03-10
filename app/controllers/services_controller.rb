class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
    @reviews = @service.reviews.includes(:user, :review_likes).order(created_at: :desc)
  end

  def service_rank
    @service_rate_ranks = Service.find(Review.group(:service_id)
                          .order('sum(rate)/count(rate) desc').limit(3).pluck(:service_id))
  end
end
