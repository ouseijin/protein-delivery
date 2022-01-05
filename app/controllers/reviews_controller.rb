class ReviewsController < ApplicationController
  before_action :require_login

  def create
    review = current_user.reviews.build(review_params)
    if review.save
      redirect_to service_path(review.service), success: '口コミを投稿しました'
    else
      redirect_to service_path(review.service), success: '口コミの投稿に失敗しました'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rate, { review_images: [] },
                                   :review_images_cache).merge(service_id: params[:service_id])
  end
end
