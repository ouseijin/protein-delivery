class ReviewsController < ApplicationController
  before_action :require_login
  before_action :set_service, only: [:new, :create]
  before_action :set_reviews, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to service_path(@review.service), success: '口コミを投稿しました'
    else
      flash.now[:warning] = '口コミ投稿に失敗しました'
      render :new
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy!
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rate, { review_images: [] },
                                   :review_images_cache).merge(service_id: params[:service_id])
  end

  def set_service
    @service = Service.find(params[:service_id])
  end

  def set_reviews
    @reviews = @service.reviews.includes(:user, :review_likes).order(created_at: :desc)
  end
end
