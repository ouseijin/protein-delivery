class ReviewLikesController < ApplicationController
  before_action :require_login

  def create
    review = Review.find(params[:review_id])
    current_user.review_like(review)
    redirect_back fallback_location: root_path, success: 'いいねしました'
  end

  def destroy
    review = current_user.review_likes.find(params[:id]).review
    current_user.review_unlike(review)
    redirect_back fallback_location: root_path, success: 'いいねを取り消しました'
  end
end
