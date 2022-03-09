class ReviewsController < ApplicationController
  before_action :require_login

  def new
    @service = Service.find(params[:service_id])
    @review = Review.new
    @reviews = @service.reviews.includes(:user, :review_likes).order(created_at: :desc)
  end

  def create
    @review = current_user.reviews.build(review_params)
    @service = Service.find(params[:service_id])
    @reviews = @service.reviews.includes(:user, :review_likes).order(created_at: :desc)
    if @review.save
      redirect_to service_path(@review.service), success: '口コミを投稿しました'
    else
      flash.now[:warning] = '口コミ投稿に失敗しました'
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rate, { review_images: [] },
                                   :review_images_cache).merge(service_id: params[:service_id])
  end
end
